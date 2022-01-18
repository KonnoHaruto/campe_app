import 'package:campe_app/controller/auth_controller/auth_controller_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../reference.dart';
import 'info_screen.dart';
import 'update_screen.dart';

class HomeScreen extends ConsumerWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
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
                return const InfoScreen();
              }));
            },
          )
        ],
        leadingWidth: 90,
        leading: IconButton(
            icon: const FaIcon(FontAwesomeIcons.signInAlt),
            onPressed: () {
              auth.signOut();
              Navigator.pop(context);
            }),
      ),
      body: SafeArea(
        child: SizedBox(
          child: Center(
            child: Column(
              children: <Widget>[
                Flexible(
                    child: StreamBuilder(
                        stream: campeRef
                            .orderBy('createdAt', descending: false)
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return const CircularProgressIndicator();
                          }
                          return ListView(
                            children: snapshot.data!.docs
                                .map((QueryDocumentSnapshot campes) {
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
                                      var updatedContent =
                                          await Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
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
      ),
    );
  }
}
