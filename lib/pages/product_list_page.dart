import 'package:flutter/material.dart';
import 'package:mock_product_mobile/utils/colors.dart';
import 'package:mock_product_mobile/widgets/app_drawer_view.dart';
import 'package:mock_product_mobile/widgets/customized_app_bar_view.dart';

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

// Product list page from categories page when user chose a category
class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: AppDrawerView(),
      backgroundColor: kWhiteColor,
      appBar: CustomizedAppBarView(
        onTapMenu: () {
          // To open drawer
          _drawerKey.currentState?.openDrawer();
        },
        appBarTitle: "Product List",
      ),
      body: Container(),
    );
  }
}
