import 'package:flutter/material.dart';
import 'package:google_translate_s/components/card.dart';

class CardEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('No transations'),
        ],
      ),
    );
  }
}
