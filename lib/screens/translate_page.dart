import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_translate_s/components/translate_widget.dart';
import 'package:google_translate_s/models/translation_request.dart';

import '../models/translations/translation_response.dart';

class TranslatePage extends StatefulWidget {
  @override
  _TranslatePageState createState() => _TranslatePageState();
}

Future<TranslationResponse> getTranslation(TranslationRequest translate) async {
  var dio = Dio();

  final q = translate.text;
  final target = translate.to.language;
  final source = translate.from.language != "auto"
      ? '&source=${translate.from.language}'
      : '';

  Response response = await dio.get(
      "https://translation.googleapis.com/language/translate/v2?key=AIzaSyAqnBxr-G5811raZcYmWODowYofAnd6TjU&q=$q&target=$target$source");

  return TranslationResponse.fromJsonMap(response.data["data"]);
}

class _TranslatePageState extends State<TranslatePage> {
  TranslationRequest translate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TranslateWidget(
          onChange: (TranslationRequest value) {
            this.setState(() {
              this.translate = value;
            });
          },
        ),
        Text(
          'Translations',
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}
