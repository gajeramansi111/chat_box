import 'package:flutter/material.dart';

import '../utility/colors.dart';

class BigText extends StatelessWidget {
  final String text;
  const BigText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.bigText,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class ChatName extends StatelessWidget {
  final String text;
  final double? fontSize;
  final fontweight;
  const ChatName({Key? key, required this.text, this.fontSize, this.fontweight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.chatColor,
        fontSize: 20,
        fontWeight: fontweight,
      ),
    );
  }
}
