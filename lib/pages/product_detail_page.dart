import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_product_mobile/data/vos/product_vos/product_vo.dart';
import 'package:mock_product_mobile/data/vos/review_vo/review_vo.dart';
import 'package:mock_product_mobile/utils/colors.dart';
import 'package:mock_product_mobile/utils/dimensions.dart';
import 'package:mock_product_mobile/utils/strings.dart';
import 'package:mock_product_mobile/widgets/customized_text_view.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({
    super.key,
    required this.product,
  });

  final ProductVO product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: CustomizedTextView(
          textData: product.title ?? "",
          textFontSize: kFont18,
          textFontWeight: FontWeight.w600,
          textColor: kBlackColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProductImagesSectionView(product: product),
            _ProductInfoSectionView(
              product: product,
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductInfoSectionView extends StatelessWidget {
  const _ProductInfoSectionView({
    required this.product,
  });

  final ProductVO product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kMargin16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              //set empty string becuz before animated text appears the space is free and make the item something happened in user interface
              const CustomizedTextView(textData: ""),
              AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  FadeAnimatedText(
                    product.warrantyInformation ?? "",
                    textStyle: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: kProductTagsColor,
                        fontWeight: FontWeight.w600,
                        fontSize: kFont16),
                  ),
                  FadeAnimatedText(
                    product.shippingInformation ?? "",
                    textStyle: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: kProductTagsColor,
                        fontWeight: FontWeight.w600,
                        fontSize: kFont16),
                  ),
                  FadeAnimatedText(
                    product.returnPolicy ?? "",
                    textStyle: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: kProductTagsColor,
                        fontWeight: FontWeight.w600,
                        fontSize: kFont16),
                  ),
                  FadeAnimatedText(
                    product.availabilityStatus ?? "",
                    textStyle: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: kProductTagsColor,
                        fontWeight: FontWeight.w600,
                        fontSize: kFont16),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: kMargin16,
          ),
          //Product title
          CustomizedTextView(
            textData: product.title ?? "",
            textFontSize: kFont18,
            textFontWeight: FontWeight.bold,
            textColor: kPrimaryColor,
          ),
          const SizedBox(
            height: kMargin16,
          ),
          // Price and discount
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomizedTextView(
                textData: "\u0e3f ${product.price}",
                textFontSize: kFont20,
                textFontWeight: FontWeight.bold,
                textColor: kProductPriceColor,
              ),
              const SizedBox(
                width: kMargin16,
              ),
              CustomizedTextView(
                textData: "\u0e3f ${product.getOriginalPrice()}",
                textFontSize: kFont14,
                textFontWeight: FontWeight.bold,
                isLinedThrough: true,
                textColor: kBlackColor.withOpacity(0.5),
              ),
              const SizedBox(
                width: kMargin16,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: kMargin8),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(kRadius20),
                ),
                child: CustomizedTextView(
                  textData: "${product.discountPercentage}%",
                  textFontSize: kFont14,
                  textColor: kWhiteColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: kMargin16,
          ),
          CustomizedTextView(
            textData: product.description ?? "",
            textColor: kBlackColor.withOpacity(0.6),
            textFontWeight: FontWeight.w400,
            textFontSize: kFont16,
          ),
          const Divider(),

          _ReviewsSectionView(
            product: product,
          )
        ],
      ),
    );
  }
}

class _ReviewsSectionView extends StatelessWidget {
  const _ReviewsSectionView({
    required this.product,
  });

  final ProductVO product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Review title and overall ratings
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Review title
            CustomizedTextView(
                textData: kTextReviewTitle.tr,
                textFontSize: kFont18,
                textColor: kPrimaryColor),
            const Spacer(),
            CustomizedTextView(
                textData: "${product.rating}",
                textFontSize: kFont16,
                textColor: kBlackColor),
            const SizedBox(
              width: kMargin8,
            ),
            _StarRating(rating: product.rating ?? 0),
            //Ratings
          ],
        ),
        // Reviews List
        ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: kMargin16),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: product.reviews?.length ?? 0,
          itemBuilder: (context, index) {
            return _ReviewItemView(
              review: product.reviews?[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: kMargin16,
          ),
        )
      ],
    );
  }
}

class _ReviewItemView extends StatelessWidget {
  const _ReviewItemView({
    this.review,
  });

  final ReviewVO? review;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kMargin16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kRadius10),
          color: kPrimaryColor.withOpacity(0.4)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Username and rating
          Row(
            children: [
              CustomizedTextView(
                textData: review?.reviewerName ?? "",
                textColor: kBlackColor,
              ),
              const SizedBox(
                width: kMargin12,
              ),
              _StarRating(rating: review?.rating?.toDouble() ?? 0)
            ],
          ),
          const SizedBox(
            height: kMargin16,
          ),
          //Comment
          CustomizedTextView(
            textData: review?.comment ?? "",
            textFontSize: kFont12,
            textColor: kBlackColor,
          )
        ],
      ),
    );
  }
}

class _StarRating extends StatelessWidget {
  final double rating;

  const _StarRating({
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    int filledStars = rating.ceil();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < filledStars ? Icons.star : Icons.star_border,
          color: Colors.yellow,
        );
      }),
    );
  }
}

class _ProductImagesSectionView extends StatelessWidget {
  const _ProductImagesSectionView({
    required this.product,
  });

  final ProductVO product;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: product.images?.length,
      itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
          Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.network(
              product.images?[index] ?? '',
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
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: kMargin12),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: kMargin12, vertical: kMargin4),
                decoration: BoxDecoration(
                    color: kBlackColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(kRadius15)),
                child: CustomizedTextView(
                  textData: "${index + 1}/${product.images?.length}",
                  textColor: kWhiteColor,
                  textFontWeight: FontWeight.w400,
                  textFontSize: kFont12,
                ),
              ),
            ),
          )
        ],
      ),
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
        // height: MediaQuery.of(context).size.height * 0.6,
        initialPage: 0,
        enableInfiniteScroll:
            ((product.images?.length ?? 0) > 1) ? true : false,
        reverse: false,
        autoPlay: ((product.images?.length ?? 0) > 1) ? true : false,
        autoPlayInterval: const Duration(seconds: 2),
        autoPlayAnimationDuration: const Duration(milliseconds: 600),
        autoPlayCurve: Curves.easeInBack,
        enlargeFactor: 0.6,
        // onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
