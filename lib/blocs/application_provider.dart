import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_product_mobile/persistence/impls/languages_dao_impl/language_dao_impl.dart';
import 'package:mock_product_mobile/persistence/languages/language_dao.dart';
import 'package:mock_product_mobile/utils/strings.dart';

class ApplicationProvider extends ChangeNotifier {
  // Default language ကို Myanmar ကို define လုပ်ထားပါတယ်
  static Locale _locale = const Locale('en', 'US');
  LanguageDao languageDao = LanguageDaoImpl();

  Locale get locale => Locale(languageDao.getCurrentLanguage(),
      languageDao.getCurrentLanguage() == 'en' ? 'US' : 'MY');

  ApplicationProvider() {
    _locale = Locale(languageDao.getCurrentLanguage(),
        languageDao.getCurrentLanguage() == 'en' ? 'US' : 'MY');
    notifyListeners();
  }

  // Language switch function
  void switchLanguage(
      {String? languageCode = 'en', bool? isFromSetting = false}) {
    if (languageCode == 'en') {
      _locale = const Locale('en', 'US');
      Get.updateLocale(_locale);
    } else {
      _locale = const Locale('th', 'TH');
      Get.updateLocale(_locale);
    }
    if (isFromSetting ?? false) {
      languageDao.saveCurrentLanguage(_locale.languageCode);
    }
    notifyListeners();
  }

  String getCurrentLanguageCodeFromDatabase() {
    return languageDao.getCurrentLanguage();
  }

  static bool get isCurrentLanguageIsThailand => _locale.languageCode == kTextTH;
}
