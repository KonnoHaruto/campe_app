import 'package:campe_app/view/update_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: Center(
        child: Column(
          children: [
            Flexible(
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
                            child: ListTile(
                              title: Text(campes['content']),
                              onLongPress: () {
                                campes.reference.delete();
                              },
                              onTap: () async {
                                var updatedContent =
                                    await Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                  return UpdatePage(oldText: campes['content']);
                                }));
                                campes.reference.update({
                                  'content': updatedContent,
                                  'updatedAt': DateTime.now()
                                });
                              },
                            ),
                          );
                        }).toList(),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
