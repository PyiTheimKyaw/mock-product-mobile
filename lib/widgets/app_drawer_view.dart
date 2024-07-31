import 'package:flutter/material.dart';
import 'package:mock_product_mobile/widgets/customized_text_view.dart';

//App drawer which includes language changes view
class AppDrawerView extends StatelessWidget {
  const AppDrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomizedTextView(textData: "textData"),
          CustomizedTextView(textData: "textData")
        ],
      ),
    );
  }
}
