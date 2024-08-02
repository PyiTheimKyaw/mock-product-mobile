import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Languages extends Translations {
  final Locale locale;

  Languages(this.locale);

  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'lblHomePageTitle': "Categories",
          'lblProductListTile': "Products List",
          'lblLanguageTitle': "Languages",
          'lblEngLang': "English",
          'lblThaiLang': "Thailand",
          'lblReviewTitle': "Reviews",
        },
        'th_TH': {
          'lblHomePageTitle': "หมวดหมู่",
          'lblProductListTile': "รายการสินค้า",
          'lblLanguageTitle': "ภาษา",
          'lblEngLang': "ภาษาอังกฤษ",
          'lblThaiLang': "ไทย",
          'lblReviewTitle': "รีวิว",
        }
      };
}
