import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  Map<String, String>? _localizedValues;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /*Language json file တွေကို load လုပ်ပြီး MapEntry အနေနဲ့ data ကို pass လုပ်ဖို့*/
  Future<void> load() async {
    //Json file ကို bundle လုပ်ပြီး Map ထဲ data တွေထည့်ပါတယ်
    String jsonString = await rootBundle.loadString(
        'assets/i18n/${locale.languageCode}_${locale.countryCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    //Map ကို loop ပတ်ပြီးး MapEntry ထဲကို ထည့်ပါတယ်
    _localizedValues = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  //Language translate ဖို့
  String? translate(String key) {
    return _localizedValues?[key];
  }
}
