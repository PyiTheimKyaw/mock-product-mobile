import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_product_mobile/blocs/product_page_bloc/product_page_bloc.dart';
import 'package:mock_product_mobile/data/vos/product_vos/product_vo.dart';
import 'package:mock_product_mobile/utils/colors.dart';
import 'package:mock_product_mobile/utils/dimensions.dart';
import 'package:mock_product_mobile/utils/strings.dart';
import 'package:mock_product_mobile/widgets/app_drawer_view.dart';
import 'package:mock_product_mobile/widgets/customized_app_bar_view.dart';
import 'package:mock_product_mobile/widgets/customized_text_view.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

// Product list page from categories page when user chose a category
class ProductListPage extends StatelessWidget {
  const ProductListPage({
    super.key,
    required this.slug,
  });

  final String? slug;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProductPageBloc(catSlug: slug),
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
          appBarTitle:
              "${slug?.capitalizeFirst} ${kTextLblProductListTitle.tr}",
        ),
        body: Selector<ProductPageBloc, List<ProductVO>?>(
          selector: (BuildContext context, bloc) => bloc.productList,
          builder: (BuildContext context, productList, Widget? child) =>
              GridView.builder(
            padding: const EdgeInsets.all(kMargin16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio:
                    (productList != null && (productList.isNotEmpty))
                        ? 9 / 14
                        : 1),
            itemCount: productList?.length ?? 10,
            itemBuilder: (context, index) {
              return (productList != null && (productList.isNotEmpty))
                  ? _ProductItemView(
                      index: index,
                      productItem: productList[index],
                    )
                  : const _ShimmerProductItem();
            },
          ),
        ),
      ),
    );
  }
}

class _ShimmerProductItem extends StatelessWidget {
  const _ShimmerProductItem();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.3),
      highlightColor: Colors.grey.withOpacity(0.7),
      child: Padding(
        padding: const EdgeInsets.all(kMargin8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kRadius15),
            border: Border.all(color: kPrimaryColor),
          ),
          padding: const EdgeInsets.symmetric(horizontal: kMargin16),
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
                height: 10.0,
                color: Colors.white,
              ),
              const SizedBox(
                height: kMargin16,
              ),
              Container(
                width: double.infinity,
                height: 10.0,
                color: Colors.white,
              ),
              const SizedBox(
                height: kMargin16,
              ),
              Container(
                width: double.infinity,
                height: 10.0,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductItemView extends StatelessWidget {
  const _ProductItemView({
    required this.index,
    required this.productItem,
  });

  final int index;
  final ProductVO? productItem;

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
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(kRadius15),
                  topRight: Radius.circular(kRadius15),
                ),
                child: Image.network(
                  productItem?.thumbnail ?? "",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: kMargin16,
            ),
            // Product detail info
            _ProductInfoView(
              productItem: productItem,
            )
          ],
        ),
      ),
    );
  }
}

// Collection of products info
class _ProductInfoView extends StatelessWidget {
  const _ProductInfoView({
    required this.productItem,
  });

  final ProductVO? productItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMargin16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product name
          CustomizedTextView(
            textData: productItem?.title ?? "",
            textColor: kPrimaryColor,
            textFontSize: kFont16,
            textFontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: kMargin4,
          ),
          // Product price and discount
          Row(
            children: [
              // Price
              CustomizedTextView(
                textData: "\u0e3f ${productItem?.price}",
                textColor: kProductPriceColor,
                textFontSize: kFont14,
              ),
              const Spacer(),
              // Discount
              Container(
                padding: const EdgeInsets.symmetric(horizontal: kMargin8),
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(kRadius20)),
                child: CustomizedTextView(
                  textData: "${productItem?.discountPercentage}%",
                  textColor: kDiscountPercentColor,
                  textFontSize: kFont12,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: kMargin4,
          ),
          // Rating
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.star,
                color: kYellowColor,
              ),
              // Rating
              CustomizedTextView(
                textData: "${productItem?.rating}",
                textColor: kBlackColor,
                textFontWeight: FontWeight.w400,
                textFontSize: kFont12,
              ),
              const Spacer(),
              //Stock
              CustomizedTextView(
                textData: "Stock :${productItem?.stock}",
                textColor: kBlackColor,
                textFontWeight: FontWeight.w400,
                textFontSize: kFont12,
              ),
            ],
          ),
          const SizedBox(
            height: kMargin4,
          ),

          // Product's tags
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //set empty string becuz before animated text appears the space is free and make the item something happened in user interface
              const CustomizedTextView(textData: ""),
              Expanded(
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    FadeAnimatedText(
                      productItem?.warrantyInformation ?? "",
                      textStyle: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: kProductTagsColor),
                    ),
                    FadeAnimatedText(
                      productItem?.shippingInformation ?? "",
                      textStyle: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: kProductTagsColor),
                    ),
                    FadeAnimatedText(
                      productItem?.returnPolicy ?? "",
                      textStyle: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: kProductTagsColor),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
