import 'package:campe_app/view/update_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../reference.dart';
import 'loading_page.dart';

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
        title: const Text('ホーム'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
                child: StreamBuilder(
                    stream: campeRef.snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return const LoadingPage();
                      }
                      return ListView(
                        children: snapshot.data!.docs.map((campes) {
                          return Center(
                            child: ListTile(
                              title: Text(campes['content']),
                              onLongPress: () {
                                campes.reference.delete();
                              },
                              onTap: () async {
                                var updatedContent = await Navigator.push(context,
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
