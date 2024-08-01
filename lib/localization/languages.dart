import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Languages extends Translations {
  final Locale locale;

  Map<String, String>? _localizedValues;

  Languages(this.locale);

  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
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

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'lblHomePageTitle': "Categories",
          'lblProductListTile': "Products List",
          'lblLanguageTitle': "Languages",
          'lblEngLang': "English",
          'lblThaiLang': "Thailand"
        },
        'th_TH': {
          'lblHomePageTitle': "หมวดหมู่",
          'lblProductListTile': "รายการสินค้า",
          'lblLanguageTitle': "ภาษา",
          'lblEngLang': "ภาษาอังกฤษ",
          'lblThaiLang': "ไทย"
        }
      };
}
