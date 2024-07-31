import 'package:flutter/material.dart';
import 'package:mock_product_mobile/utils/colors.dart';
import 'package:mock_product_mobile/utils/dimensions.dart';
import 'package:mock_product_mobile/widgets/customized_text_view.dart';

//Customized App bar for the whole app
class CustomizedAppBarView extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomizedAppBarView(
      {super.key, required this.onTapMenu, required this.appBarTitle});

  final Function onTapMenu;
  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kWhiteColor,
      leading: IconButton(
        onPressed: () {
          onTapMenu();
        },
        icon: const Icon(Icons.menu),
      ),
      centerTitle: true,
      title: CustomizedTextView(
        textData: appBarTitle,
        textFontSize: kFont18,
        textFontWeight: FontWeight.bold,
        textColor: kBlackColor,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
