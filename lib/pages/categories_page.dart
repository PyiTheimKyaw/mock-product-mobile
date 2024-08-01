import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_product_mobile/blocs/category_page_bloc/category_page_bloc.dart';
import 'package:mock_product_mobile/data/vos/category_vos/category_vo.dart';
import 'package:mock_product_mobile/utils/colors.dart';
import 'package:mock_product_mobile/utils/dimensions.dart';
import 'package:mock_product_mobile/utils/route_constants.dart';
import 'package:mock_product_mobile/utils/strings.dart';
import 'package:mock_product_mobile/widgets/app_drawer_view.dart';
import 'package:mock_product_mobile/widgets/customized_app_bar_view.dart';
import 'package:mock_product_mobile/widgets/customized_text_view.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

// Home page of app which shows the list of categories and user can view and choose
class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CategoryPageBloc(),
      child: Scaffold(
        key: _drawerKey,
        drawer: const AppDrawerView(),
        drawerEnableOpenDragGesture: false,
        backgroundColor: kWhiteColor,
        appBar: CustomizedAppBarView(
          onTapMenu: () {
            // To open drawer
            _drawerKey.currentState?.openDrawer();
          },
          appBarTitle: kTextLblHomeTitle.tr,
        ),
        body: const _CategoriesListSectionView(),
      ),
    );
  }
}

// Collection of categories section
class _CategoriesListSectionView extends StatelessWidget {
  const _CategoriesListSectionView();

  @override
  Widget build(BuildContext context) {
    return Selector<CategoryPageBloc, List<CategoryVO>?>(
      selector: (BuildContext context, bloc) => bloc.categories,
      builder: (BuildContext context, categories, Widget? child) =>
          GridView.builder(
        padding: const EdgeInsets.all(kMargin16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: kMargin16,
          mainAxisSpacing: kMargin16,
          // childAspectRatio: 0.8
        ),
        itemCount: categories?.length ?? 10,
        itemBuilder: (context, index) {
          return (categories != null && (categories.isNotEmpty))
              ? _CategoryItemView(
                  categoryItem: categories[index],
                )
              // If categories list is null or empty show shimmer loading widget
              : const _ShimmerCategoryItem();
        },
      ),
    );
  }
}

class _ShimmerCategoryItem extends StatelessWidget {
  const _ShimmerCategoryItem();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.3),
      highlightColor: Colors.grey.withOpacity(0.7),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kRadius15),
          border: Border.all(color: kPrimaryColor),
        ),
        padding: const EdgeInsets.all(kMargin16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
            ),
            const SizedBox(
              height: kMargin16,
            ),
            Container(
              width: double.infinity,
              height: 20.0,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

// Each category item view
class _CategoryItemView extends StatelessWidget {
  const _CategoryItemView({
    required this.categoryItem,
  });

  final CategoryVO categoryItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // To navigate to the product list page
        Get.toNamed(RouteConstants.kRouteProductList,
            parameters: {"slug": "${categoryItem.slug}"});
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //First category item thumbnail image
            // Expanded(
            //   child: Image.network(
            //       "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png"),
            // ),
            const Expanded(
                flex: 2,
                child: Icon(
                  Icons.category_outlined,
                  color: kPrimaryColor,
                  size: 50,
                )),
            // Category name
            CustomizedTextView(
              textData: categoryItem.name ?? "",
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
