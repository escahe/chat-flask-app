import 'package:chat/interfaz/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAbCwvlS2ixn1SolqdAHwGDKihLieTpPJQ",
          authDomain:
              "166088455556-c9shrcv0210blvra31ts0eltq201au0h.apps.googleusercontent.com",
          projectId: "chat-4244c",
          storageBucket: "chat-4244c.appspot.com",
          messagingSenderId: "",
          appId: "1:166088455556:android:064bc3e58d239f885b99d1",
          measurementId: ""));
  runApp(const MyApp());
}
