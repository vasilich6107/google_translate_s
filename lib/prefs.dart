import 'dart:async';
import 'dart:convert';

import 'package:crypted_preferences/crypted_preferences.dart';

import 'models/translation_pref.dart';

class Pref {
  static const String _path = './prefs';
  static Completer<Preferences> _completer;

  static Future<Preferences> getInstance() async {
    if (_completer == null) {
      _completer = Completer<Preferences>();
      try {
        final test = await Preferences.preferences(path: _path);
        _completer.complete(test);
      } on Exception catch (e) {
        _completer.completeError(e);
        final Future<Preferences> prefFuture = _completer.future;
        _completer = null;
        return prefFuture;
      }
    }
    return _completer.future;
  }
}

Future<TranslationPref> translationPrefRead() async {
  final prefs = await Pref.getInstance();

  final data = prefs.getString('translations');

  if (data == null) {
    return TranslationPref([]);
  }

  final dataDecoded = json.decode(data);

  // flutter web returns back slashed data from local storage
  // so we need to decode it twice to get Map<String, dynamic>
  return TranslationPref.fromMap(
      dataDecoded is String ? json.decode(dataDecoded) : dataDecoded);
}

translationPrefWrite(TranslationPref translationPref) async {
  final prefs = await Pref.getInstance();

  return await prefs.setString(
      'translations', json.encode(translationPref.toMap()));
}
