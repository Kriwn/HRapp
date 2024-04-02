import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hr/firebase_options.dart';
import 'views/Account/SignInView.dart';
import 'package:geolocator/geolocator.dart';

Future<Position> getLocation() async {
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
  return position;
}

late final FirebaseApp app;
late final FirebaseAuth auth;
late final FirebaseFirestore fireStore;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  auth = FirebaseAuth.instanceFor(app: app);

  fireStore = FirebaseFirestore.instanceFor(app: app);

  fireStore.settings = const Settings(
    persistenceEnabled: true,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignIn(),
    );
  }
}