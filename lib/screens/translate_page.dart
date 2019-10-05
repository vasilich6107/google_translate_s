import 'package:flutter/material.dart';
import 'package:google_translate_s/components/translate_widget.dart';

class TranslatePage extends StatefulWidget {
  @override
  _TranslatePageState createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TranslateWidget(),
        Text(
          'Translations',
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}
