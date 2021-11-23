import 'package:campe_app/view/update_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../reference.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Campe 一覧',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[

          IconButton(
            icon: const FaIcon(FontAwesomeIcons.infoCircle),
            onPressed: () {
              showCupertinoDialog(
                context: context,
                builder: (BuildContext context) {
                  return const CupertinoAlertDialog(
                    title: Text(''),
                    content: Text(''),
                    actions: [],
                  );
                },
              );
            },
          )
        ],
        leadingWidth: 90,
        leading: IconButton(
            icon: const FaIcon(FontAwesomeIcons.signInAlt),
            onPressed: () {
              Navigator.pop(context);
            }
              ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Flexible(
                  child: StreamBuilder(
                      stream: campeRef
                          .orderBy(
                            'createdAt',
                            descending: false,
                          )
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return const CircularProgressIndicator();
                        }
                        return ListView(
                          children: snapshot.data!.docs.map((campes) {
                            if (campes['content'] == null) {
                              campes.reference.update({
                                'content': '( 未入力 )',
                              });
                            } else if (campes['content'] == bool) {
                              campes.reference.update({
                                'content': '( 未入力 )',
                              });
                            }
                            return Center(
                              child: Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ListTile(
                                  dense: false,
                                  title: Text(campes['content'].toString()),
                                  onLongPress: () {
                                    campes.reference.delete();
                                  },
                                  onTap: () async {
                                    var updatedContent = await Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                      return UpdatePage(
                                          oldText: campes['content']);
                                    }));
                                    campes.reference.update({
                                      'content': updatedContent,
                                      'updatedAt': DateTime.now()
                                    });
                                  },
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
