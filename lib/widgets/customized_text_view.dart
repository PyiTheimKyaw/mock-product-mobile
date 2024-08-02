import 'package:flutter/material.dart';
import 'package:mock_product_mobile/utils/colors.dart';
import 'package:mock_product_mobile/utils/dimensions.dart';
import 'package:mock_product_mobile/utils/fonts.dart';

class CustomizedTextView extends StatelessWidget {
  const CustomizedTextView({
    super.key,
    required this.textData,
    this.textFontSize = kFont16,
    this.textColor = kWhiteColor,
    this.textFontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.isLinedThrough = false,
    this.textHeight,
    this.letterSpacing,
    this.overflow,
  });

  final String textData;
  final double textFontSize;
  final Color? textColor;
  final FontWeight? textFontWeight;
  final TextAlign? textAlign;
  final bool? isLinedThrough;
  final double? textHeight;
  final double? letterSpacing;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      textData,
      style: TextStyle(
          fontSize: textFontSize,
          color: textColor,
          fontWeight: textFontWeight,
          height: textHeight,
          letterSpacing: letterSpacing,
          overflow: overflow,
          fontFamily: kFontDMS,
          decoration: (isLinedThrough ?? false) ? TextDecoration.lineThrough : null,
          decorationColor: textColor,
          decorationStyle: TextDecorationStyle.solid),
      textAlign: textAlign,
    );
  }
}
