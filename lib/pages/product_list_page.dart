import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mock_product_mobile/utils/colors.dart';
import 'package:mock_product_mobile/utils/dimensions.dart';
import 'package:mock_product_mobile/widgets/app_drawer_view.dart';
import 'package:mock_product_mobile/widgets/customized_app_bar_view.dart';
import 'package:mock_product_mobile/widgets/customized_text_view.dart';

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

// Product list page from categories page when user chose a category
class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const AppDrawerView(),
      backgroundColor: kWhiteColor,
      appBar: CustomizedAppBarView(
        onTapMenu: () {
          // To open drawer
          _drawerKey.currentState?.openDrawer();
        },
        appBarTitle: "Product List",
      ),
      body: MasonryGridView.builder(
        padding: const EdgeInsets.all(kMargin16),
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return _ProductItemView(
            index: index,
          );
        },
      ),
    );
  }
}

class _ProductItemView extends StatelessWidget {
  const _ProductItemView({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kMargin8),
      child: Container(
        padding: const EdgeInsets.only(bottom: kMargin16),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product thumbnail image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(kRadius15),
                topRight: Radius.circular(kRadius15),
              ),
              child: Image.asset(
                "assets/images/free-images$index.jpg",
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: kMargin16,
            ),
            // Product detail info
            const _ProductInfoView()
          ],
        ),
      ),
    );
  }
}

// Collection of products info
class _ProductInfoView extends StatelessWidget {
  const _ProductInfoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMargin16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product name
          const CustomizedTextView(
            textData: "Badmintion Shoe shoes",
            textColor: kPrimaryColor,
            textFontSize: kFont16,
            textFontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
          // Product price and discount
          Row(
            children: [
              // Price
              const CustomizedTextView(
                textData: "\u0e3f 9.12",
                textColor: kProductPriceColor,
                textFontSize: kFont14,
              ),
              const SizedBox(
                width: kMargin12,
              ),
              // Discount
              Container(
                padding: const EdgeInsets.symmetric(horizontal: kMargin8),
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(kRadius20)),
                child: const CustomizedTextView(
                  textData: "9%",
                  textColor: kDiscountPercentColor,
                  textFontSize: kFont12,
                ),
              ),
            ],
          ),
          // Rating
          const Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.star,
                color: kYellowColor,
              ),
              // Rating
              CustomizedTextView(
                textData: "4.5",
                textColor: kBlackColor,
                textFontWeight: FontWeight.w400,
                textFontSize: kFont12,
              ),
              Spacer(),
              //Stock
              CustomizedTextView(
                textData: "Stock :59",
                textColor: kBlackColor,
                textFontWeight: FontWeight.w400,
                textFontSize: kFont12,
              ),
            ],
          ),
          // Product's tags
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomizedTextView(textData: ""),
              AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  FlickerAnimatedText('Flicker Frenzy'),
                  FlickerAnimatedText('Night Vibes On'),
                  FlickerAnimatedText("C'est La Vie !"),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
