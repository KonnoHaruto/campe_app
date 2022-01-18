import 'package:cloud_firestore/cloud_firestore.dart';

extension FirebaseFirestoreX on FirebaseFirestore {
  CollectionReference userListRef(String userId) {
    return collection('userLists').doc(userId).collection('campes');
  }
}
