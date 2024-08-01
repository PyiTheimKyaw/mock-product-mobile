import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_product_mobile/blocs/app_drawer_bloc/app_drawer_bloc.dart';
import 'package:mock_product_mobile/utils/colors.dart';
import 'package:mock_product_mobile/utils/dimensions.dart';
import 'package:mock_product_mobile/utils/images.dart';
import 'package:mock_product_mobile/utils/strings.dart';
import 'package:mock_product_mobile/widgets/customized_text_view.dart';
import 'package:provider/provider.dart';

//App drawer which includes language changes view
class AppDrawerView extends StatelessWidget {
  const AppDrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AppDrawerBloc(),
      child: Selector<AppDrawerBloc, String>(
        selector: (BuildContext context, bloc) => bloc.chosenLanguage,
        shouldRebuild: (prev, next) => prev != next,
        builder: (BuildContext context, chosenLanguage, Widget? child) =>
            Drawer(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kMargin16,
              vertical: kMargin64,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomizedTextView(
                  textData: kTextLanguagesTitle.tr,
                  textColor: kBlackColor,
                  textFontWeight: FontWeight.w600,
                  textFontSize: kFont16,
                ),
                const Divider(),
                GestureDetector(
                  onTap: () {
                    var languageBloc =
                        Provider.of<AppDrawerBloc>(context, listen: false);
                    languageBloc.chooseLanguage(kTextTH);
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        ImagesUtil.kThaiFlagImg,
                        width: kFlagSize,
                        height: kFlagSize,
                      ),
                      const SizedBox(
                        width: kMargin8,
                      ),
                      CustomizedTextView(
                        textData: kTextThaiLang.tr,
                        textColor: chosenLanguage == kTextTH
                            ? kPrimaryColor
                            : kLowPrimaryColor,
                        textFontWeight: chosenLanguage == kTextTH
                            ? FontWeight.bold
                            : FontWeight.w400,
                        textFontSize:
                            chosenLanguage == kTextTH ? kFont18 : kFont12,
                      ),
                    ],
                  ),
                ),
                const Divider(),
                GestureDetector(
                  onTap: () {
                    var languageBloc =
                        Provider.of<AppDrawerBloc>(context, listen: false);
                    languageBloc.chooseLanguage(kTextEN);
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        ImagesUtil.kEngFlagImg,
                        width: kFlagSize,
                        height: kFlagSize,
                      ),
                      const SizedBox(
                        width: kMargin8,
                      ),
                      CustomizedTextView(
                        textData: kTextEngLang.tr,
                        textColor: chosenLanguage == kTextEN
                            ? kPrimaryColor
                            : kLowPrimaryColor,
                        textFontWeight: chosenLanguage == kTextEN
                            ? FontWeight.bold
                            : FontWeight.w400,
                        textFontSize:
                            chosenLanguage == kTextEN ? kFont18 : kFont12,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
