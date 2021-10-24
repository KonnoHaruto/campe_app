import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../reference.dart';
import 'loading_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('campe'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
                child: StreamBuilder(
                    // streamにデータが流れてくると自動で再描画される
                    stream: campe.snapshots(),
                    // QuerySnapshotはCollectionReferenceで
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return const LoadingPage();
                      }
                      return ListView(
                        // data!はnullが入らないことを明示するためのもの・
                        // 上のif文でnullが入った際の処理をしている。
                        children: snapshot.data!.docs.map((campes) {
                          return Center(
                            child: ListTile(
                              title: Text(campes['content']),
                              onLongPress: () {
                                campes.reference.delete();
                                //ignore: avoid_print
                                print('deleted: $campes');
                              },
                            ),
                          );
                        }).toList(),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
