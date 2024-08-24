import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  FirebaseOptions get options {
    if (kIsWeb) {
      // Web
      return const FirebaseOptions(
          apiKey: "AIzaSyBIBmW6G3Q5YE26K5fA7Imti2Kwtkesijk",
          authDomain: "schoenstattapps.firebaseapp.com",
          projectId: "schoenstattapps",
          storageBucket: "schoenstattapps.appspot.com",
          messagingSenderId: "959352540933",
          appId: "1:959352540933:web:083101142ce3a68127316c",
          measurementId: "G-6R5VW6TC7K");
    } else if (Platform.isIOS || Platform.isMacOS) {
      // iOS and MacOS
      return const FirebaseOptions(
          apiKey: "AIzaSyBIBmW6G3Q5YE26K5fA7Imti2Kwtkesijk",
          authDomain: "schoenstattapps.firebaseapp.com",
          projectId: "schoenstattapps",
          storageBucket: "schoenstattapps.appspot.com",
          messagingSenderId: "959352540933",
          appId: "1:959352540933:web:083101142ce3a68127316c",
          measurementId: "G-6R5VW6TC7K");
    } else {
      // Android
      return const FirebaseOptions(
          apiKey: "AIzaSyBIBmW6G3Q5YE26K5fA7Imti2Kwtkesijk",
          authDomain: "schoenstattapps.firebaseapp.com",
          projectId: "schoenstattapps",
          storageBucket: "schoenstattapps.appspot.com",
          messagingSenderId: "959352540933",
          appId: "1:959352540933:web:083101142ce3a68127316c",
          measurementId: "G-6R5VW6TC7K");
    }
  }
}
