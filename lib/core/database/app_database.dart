import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

typedef OnAddDocCallback = Function(String id);
typedef OnGetDocCallback = Function(Map<String, dynamic> data);
typedef OnGetAllCallback = Function(List<Map<String, dynamic>> dataList);
typedef OnUpdateDocCallback = Function(String id);

class AppDatabase {
  addDocument(String collectionPath, Map<String, dynamic> data,
      OnAddDocCallback callback) {
    var collection = _getCollectionReference(collectionPath);
    collection.add(data).then((DocumentReference doc) {
      log('DocumentSnapshot added with ID: ${doc.id}');
      callback(doc.id);
    }).onError((e, _) {
      log("Error writing document: $e");
    });
  }

  addDocumentWithId(String collectionPath, String documentId,
      Map<String, dynamic> data, OnAddDocCallback callback) {
    var document = _getDocumentReference(collectionPath, documentId);
    document.set(data).then((value) {
      log('DocumentSnapshot added with ID: $documentId');
      callback(documentId);
    }).onError((e, _) {
      log("Error writing document: $e");
    });
  }

  getAllDocuments(String collectionPath, OnGetAllCallback callback) async {
    List<Map<String, dynamic>> list = [];
    var collection = _getCollectionReference(collectionPath);
    await collection.get().then((event) {
      for (DocumentSnapshot doc in event.docs) {
        log("${doc.id} => ${doc.data()}");
        list.add(doc.data() as Map<String, dynamic>);
      }
      callback(list);
    }).onError((e, _) {
      log("Error getting all documents: $e");
    });
  }

  getDocument(String collectionPath, String documentId,
      OnGetDocCallback callback) async {
    var document = _getDocumentReference(collectionPath, documentId);
    await document.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        log("DocumentData => ${documentSnapshot.data()}");
        callback(documentSnapshot.data() as Map<String, dynamic>);
      }
    }).onError((e, _) {
      log("Error get document: $e");
    });
  }

  updateDocument(
      String collectionPath, String documentId, Map<String, dynamic> data, OnUpdateDocCallback callback) {
    var document = _getDocumentReference(collectionPath, documentId);
    document.update(data).then((value) {
      log('DocumentSnapshot added with ID: $documentId');
      callback(documentId);
    }).onError((e, _) {
      log("Error updating document: $e");
    });
  }

  updateDocumentOnlyField(
      String collectionPath, String documentId, String field, dynamic value, OnUpdateDocCallback callback) {
    var document = _getDocumentReference(collectionPath, documentId);
    document.update({
      field: value
    }).then((value) {
      log('DocumentSnapshot added with ID: $documentId');
      callback(documentId);
    }).onError((e, _) {
      log("Error updating document: $e");
    });
  }

  CollectionReference _getCollectionReference(String collectionPath) {
    var db = FirebaseFirestore.instance;
    return db.collection(collectionPath);
  }

  DocumentReference _getDocumentReference(
      String collectionPath, String documentId) {
    var collection = _getCollectionReference(collectionPath);
    return collection.doc(documentId);
  }
}
