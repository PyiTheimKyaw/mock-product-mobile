import 'package:flutter/material.dart';
import 'app_localizations.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  //Support လုပ်မယ့် language code တွေကို စစ်ထားပါတယ်
  @override
  bool isSupported(Locale locale) => ['en', 'my'].contains(locale.languageCode);

  //Language switch button ကို နှိပ်ရင် language file တွေကို load လုပ်ပါမယ်
  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    //Language switch button ကို နှိပ်ရင်  language json file တွေကို bundle လုပ်ပြီး MapEntry value ရပါမယ်
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
