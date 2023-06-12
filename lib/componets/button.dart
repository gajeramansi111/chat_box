import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Button extends StatelessWidget {
  final void Function()? onTap;
  final color;
  final textColor;
  final String text;
  const Button(
      {Key? key, this.onTap, this.color, this.textColor, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    return MaterialButton(
      onPressed: onTap,
      height: height * 0.075,
      minWidth: width,
      elevation: 0,
      color: color,
      textColor: textColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Text(text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
    );
  }
}
