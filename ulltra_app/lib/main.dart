import 'package:flutter/material.dart';
import 'package:ulltra_app/pages/login_page.dart';
import 'package:ulltra_app/pages/register_page.dart';
import 'package:ulltra_app/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ultra App Mis Sitios de Interés',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const SplashPage(),
    );
  }
}