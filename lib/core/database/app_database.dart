import 'dart:developer';

import 'package:app/core/repository/app_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppDatabase {
  addDocument(String collectionPath, Map<String, dynamic> data,
      OnSuccessCallback onSuccess, OnErrorCallback onError) {
    var collection = _getCollectionReference(collectionPath);
    collection.add(data).then((DocumentReference doc) {
      log('DocumentSnapshot added with ID: ${doc.id}');
      onSuccess(doc.id);
    }).onError((e, _) {
      log("Error writing document: $e");
      onError();
    });
  }

  addDocumentWithId(
      String collectionPath,
      String documentId,
      Map<String, dynamic> data,
      OnSuccessCallback onSuccess,
      OnErrorCallback onError) {
    var document = _getDocumentReference(collectionPath, documentId);
    document.set(data).then((value) {
      log('DocumentSnapshot added with ID: $documentId');
      onSuccess(documentId);
    }).onError((e, _) {
      log("Error writing document: $e");
      onError();
    });
  }

  getAllDocuments(String collectionPath, OnGetAllCallback callback,
      OnErrorCallback onError) async {
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
      onError();
    });
  }

  getDocument(String collectionPath, String documentId,
      OnGetDocCallback callback, OnErrorCallback onError) async {
    var document = _getDocumentReference(collectionPath, documentId);
    await document.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        log("DocumentData => ${documentSnapshot.data()}");
        callback(documentSnapshot.data() as Map<String, dynamic>);
      } else {
        callback(null);
      }
    }).onError((e, _) {
      log("Error get document: $e");
      onError();
    });
  }

  updateDocument(
      String collectionPath,
      String documentId,
      Map<String, dynamic> data,
      OnSuccessCallback onSuccess,
      OnErrorCallback onError) {
    var document = _getDocumentReference(collectionPath, documentId);
    document.update(data).then((value) {
      log('DocumentSnapshot added with ID: $documentId');
      onSuccess(documentId);
    }).onError((e, _) {
      log("Error updating document: $e");
      onError();
    });
  }

  updateDocumentOnlyField(
      String collectionPath,
      String documentId,
      String field,
      dynamic value,
      OnSuccessCallback onSuccess,
      OnErrorCallback onError) {
    var document = _getDocumentReference(collectionPath, documentId);
    document.update({field: value}).then((value) {
      log('DocumentSnapshot added with ID: $documentId');
      onSuccess(documentId);
    }).onError((e, _) {
      log("Error updating document: $e");
      onError();
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
