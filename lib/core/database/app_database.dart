import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

typedef OnAddDocCallback = Function(String id);
typedef OnGetDocCallback = Function(Map<String, dynamic> data);
typedef OnGetAllCallback = Function(List<Map<String, dynamic>> dataList);

class AppDatabase {
  addDocument(String collectionPath, Map<String, dynamic> data,
      OnAddDocCallback callback) {
    var db = FirebaseFirestore.instance;
    db.collection(collectionPath).add(data).then((DocumentReference doc) {
      log('DocumentSnapshot added with ID: ${doc.id}');
      callback(doc.id);
    });
  }

  addDocumentWithId(String collectionPath, String documentId,
      Map<String, dynamic> data, OnAddDocCallback callback) {
    var db = FirebaseFirestore.instance;
    db.collection(collectionPath).doc(documentId).set(data).then((value) {
      log('DocumentSnapshot added with ID: $documentId');
      callback(documentId);
    }).onError((e, _) {
      log("Error writing document: $e");
    });
  }

  getAllDocuments(String collectionPath, OnGetAllCallback callback) async {
    List<Map<String, dynamic>> list = [];
    var db = FirebaseFirestore.instance;
    await db.collection(collectionPath).get().then((event) {
      for (var doc in event.docs) {
        log("${doc.id} => ${doc.data()}");
        list.add(doc.data());
      }
      callback(list);
    });
  }

  getDocument(String collectionPath, String documentId,
      OnGetDocCallback callback) async {
    var db = FirebaseFirestore.instance;
    await db
        .collection(collectionPath)
        .doc(documentId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        log("DocumentData => ${documentSnapshot.data()}");
        callback(documentSnapshot.data() as Map<String, dynamic>);
      }
    });
  }
}
