import 'package:flutter/material.dart';
import 'package:google_translate_s/screens/main_page.dart';

void main() => runApp(GoogleTranslateApp());

class GoogleTranslateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
