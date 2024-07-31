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
    this.textFontWeight = FontWeight.w500,
    this.textAlign = TextAlign.start,
    this.isUnderlined = false,
    this.textHeight,
    this.letterSpacing,
  });

  final String textData;
  final double textFontSize;
  final Color? textColor;
  final FontWeight? textFontWeight;
  final TextAlign? textAlign;
  final bool? isUnderlined;
  final double? textHeight;
  final double? letterSpacing;

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
          fontFamily: kFontDMS,
          decoration: (isUnderlined ?? false) ? TextDecoration.underline : null,
          decorationColor: textColor,
          decorationStyle: TextDecorationStyle.solid),
      textAlign: textAlign,
    );
  }
}
