import 'package:flutter/material.dart';

import '../utility/colors.dart';

class SmallText extends StatelessWidget {
  final String text;
  final double fontSize;
  final textalign;
  final fontweight;

  const SmallText(
      {Key? key,
      required this.text,
      required this.fontSize,
      this.fontweight,
      this.textalign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textalign,
      style: TextStyle(
        color: AppColors.smallText,
        fontSize: fontSize,
        fontWeight: fontweight,
      ),
    );
  }
}

class boldText extends StatelessWidget {
  final String text;
  final double fontSize;
  final textalign;
  final fontweight;

  const boldText(
      {Key? key,
      required this.text,
      required this.fontSize,
      this.fontweight,
      this.textalign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textalign,
      style: TextStyle(
        color: AppColors.bigText,
        fontSize: fontSize,
        fontWeight: fontweight,
      ),
    );
  }
}
