import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../reference.dart';
import 'info_page.dart';
import 'update_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEdgeDragWidth: 0.0,
      appBar: AppBar(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25) ,
          ),
        ),
        title: const Text(
          'カンペ 一覧',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.infoCircle),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return const InfoPage();
              }));
            },
          )
        ],
        leadingWidth: 90,
        leading: IconButton(
            icon: const FaIcon(FontAwesomeIcons.signInAlt),
            onPressed: () async {
              await _auth.signOut();
              Navigator.pop(context);
            }),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 15),
          child: Center(
            child: Column(
              children: <Widget>[
                const FaIcon(FontAwesomeIcons.peopleCarry),
                Flexible(
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(top: 15),
                    child: StreamBuilder(
                        stream: campeRef
                            .orderBy(
                              'createdAt',
                              descending: false,
                            )
                            .snapshots(),
                        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: ListTile(
                                    dense: false,
                                    leading: const Text('index'),
                                    title: Text(campes['content'].toString()),
                                    onLongPress: () {
                                      campes.reference.delete();
                                    },
                                    onTap: () async {
                                      var updatedContent =
                                          await Navigator.push(context,
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
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
