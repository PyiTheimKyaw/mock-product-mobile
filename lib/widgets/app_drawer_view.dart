import 'package:flutter/material.dart';
import 'package:mock_product_mobile/utils/colors.dart';
import 'package:mock_product_mobile/utils/dimensions.dart';
import 'package:mock_product_mobile/utils/strings.dart';
import 'package:mock_product_mobile/widgets/customized_text_view.dart';

//App drawer which includes language changes view
class AppDrawerView extends StatelessWidget {
  const AppDrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            const CustomizedTextView(
              textData: "Languages",
              textColor: kBlackColor,
              textFontWeight: FontWeight.w600,
              textFontSize: kFont16,
            ),
            const Divider(),
            Row(
              children: [
                Image.asset(
                  "assets/images/th_flag.png",
                  width: 50,
                  height: 50,
                ),
                const CustomizedTextView(
                  textData: kTextThailand,
                  textColor: kBlackColor,
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Image.asset(
                  "assets/images/en_flag.png",
                  width: 50,
                  height: 50,
                ),
                const CustomizedTextView(
                  textData: kTextEnglish,
                  textColor: kBlackColor,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
