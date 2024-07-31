import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mock_product_mobile/utils/colors.dart';
import 'package:mock_product_mobile/utils/dimensions.dart';
import 'package:mock_product_mobile/utils/route_constants.dart';
import 'package:mock_product_mobile/widgets/app_drawer_view.dart';
import 'package:mock_product_mobile/widgets/customized_app_bar_view.dart';
import 'package:mock_product_mobile/widgets/customized_text_view.dart';

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

// Home page of app which shows the list of categories and user can view and choose
class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

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
        appBarTitle: "Categories",

      ),
      body: const _CategoriesListSectionView(),
    );
  }
}

// Collection of categories section
class _CategoriesListSectionView extends StatelessWidget {
  const _CategoriesListSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(kMargin16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: kMargin16,
        mainAxisSpacing: kMargin16,
        // childAspectRatio: 0.8
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return _CategoryItemView();
      },
    );
  }
}

// Each category item view
class _CategoryItemView extends StatelessWidget {
  const _CategoryItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // To navigate to the product list page
        context.go(RouteConstants.kRouteProductList);
      },
      child: Container(
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(kRadius15),
          border: Border.all(color: kPrimaryColor),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.all(kMargin16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //First category item thumbnail image
            Expanded(
              child: Image.network(
                  "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png"),
            ),
            // Category name
            const CustomizedTextView(
              textData: "Category",
              textColor: kBlackColor,
              textFontSize: kFont16,
              textFontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
