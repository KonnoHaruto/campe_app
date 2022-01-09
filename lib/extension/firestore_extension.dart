import 'package:cloud_firestore/cloud_firestore.dart';

extension FirebaseFirestoreX on FirebaseFirestore {
  CollectionReference userListRef(String userId) {
    return collection('todos').doc(userId).collection('userList');
  }
}
