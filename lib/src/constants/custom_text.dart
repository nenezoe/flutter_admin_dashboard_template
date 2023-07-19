import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    @required this.title,
    this.fontSize,
    this.textAlign,
    this.textColor,
    this.fontWeight,
    this.maxLine,
    this.overflow,
    this.textDecoration,
    this.fontfamily,  this.fontstyle,
  })  : assert(title != null),
        super(key: key);
  final String? title;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLine;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;
  final FontStyle? fontstyle;
  final String? fontfamily;
  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      textAlign: textAlign,
      maxLines: maxLine,
      overflow: overflow,
      softWrap: true,
      style: TextStyle(
          fontStyle: fontstyle,
          fontFamily: fontfamily,
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontWeight,
          decoration: textDecoration),
    );
  }
}
