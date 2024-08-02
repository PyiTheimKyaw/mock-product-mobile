import 'package:hive/hive.dart';
import 'package:mock_product_mobile/persistence/languages/language_dao.dart';
import 'package:mock_product_mobile/utils/strings.dart';

class LanguageDaoImpl extends LanguageDao {
  static LanguageDaoImpl? _instance;

  factory LanguageDaoImpl() {
    _instance ??= LanguageDaoImpl._internal();
    return _instance!;
  }

  LanguageDaoImpl._internal();

  @override
  void saveCurrentLanguage(String locale) async {
    await getLanguageBox().put('currentLanguageCode', locale);
  }

  @override
  String getCurrentLanguage() {
    return getLanguageBox().get('currentLanguageCode') ?? kTextEN;
  }

  Box<String> getLanguageBox() {
    return Hive.box<String>(kLanguageBox);
  }
}
