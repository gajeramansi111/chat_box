import 'package:flutter/material.dart';

import '../utility/colors.dart';

class CommonTextField extends StatelessWidget {
  final String labletext;
  final String? Function(String?)? validator;
  final obsecure;

  final void Function(String)? onChange;
  final TextEditingController? controller;

  const CommonTextField({
    Key? key,
    required this.labletext,
    this.validator,
    this.obsecure,
    this.onChange,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      obscureText: obsecure ?? false,
      validator: validator,
      controller: controller,
      obscuringCharacter: "*",
      decoration: InputDecoration(
          labelText: labletext,
          contentPadding: const EdgeInsets.only(
            bottom: 30,
          ),
          labelStyle: const TextStyle(
              fontSize: 14,
              color: AppColors.lableText,
              fontWeight: FontWeight.w500),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.divider),
          ),
          errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.error)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.divider))),
    );
  }
}
