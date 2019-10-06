import 'package:flutter/material.dart';
import 'package:google_translate_s/components/card.dart';

class CardError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Error occured',
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
