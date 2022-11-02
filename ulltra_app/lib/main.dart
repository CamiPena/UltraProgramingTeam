import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ulltra_app/firebase_options.dart';
import 'package:ulltra_app/pages/home_page.dart';
import 'package:ulltra_app/pages/home_page2.dart';
import 'package:ulltra_app/pages/home_page3.dart';
import 'package:ulltra_app/pages/home_page4.dart';
import 'package:ulltra_app/pages/home_page5.dart';
import 'package:ulltra_app/pages/login_page.dart';
import 'package:ulltra_app/pages/register_page.dart';
import 'package:ulltra_app/pages/splash_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ultra App Mis Sitios de Interés',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const SplashPage(),
    );
  }
}