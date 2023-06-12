import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/colors.dart';

class CommonContainer extends StatelessWidget {
  final image;
  const CommonContainer({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
      body: Container(
        height: height * 0.15,
        width: width * 0.15,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.containerBorder)),
        child: Image(image: image),
      ),
    );
  }
}
