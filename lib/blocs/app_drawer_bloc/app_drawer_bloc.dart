import 'package:mock_product_mobile/blocs/application_provider.dart';
import 'package:mock_product_mobile/blocs/base_bloc.dart';
import 'package:mock_product_mobile/utils/strings.dart';

class AppDrawerBloc extends BaseBloc {
  String chosenLanguage = kTextEN;

  AppDrawerBloc() {
    chosenLanguage =
        ApplicationProvider.isCurrentLanguageIsThailand ? kTextTH : kTextEN;
    notifySafely();
  }

  void chooseLanguage(String languageCode) {
    chosenLanguage = languageCode;
    ApplicationProvider()
        .switchLanguage(languageCode: chosenLanguage, isFromSetting: true);
    notifySafely();
  }
}
