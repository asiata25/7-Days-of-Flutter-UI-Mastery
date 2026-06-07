import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/get_started.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const GetStarted(),
    );
  }
}
