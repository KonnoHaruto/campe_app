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
                    stream: campe.snapshots(),
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
