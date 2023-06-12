import 'dart:ui';

import 'package:chat_box/view/video_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../utility/colors.dart';
import '../utility/icon_url.dart';
import '../utility/image_url.dart';
import '../utility/text_string.dart';

class IncominCall extends StatefulWidget {
  const IncominCall({Key? key}) : super(key: key);

  @override
  State<IncominCall> createState() => _IncominCallState();
}

class _IncominCallState extends State<IncominCall> {
  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height,
            width: width,
            // height: height * 0.8,
            // width: width * 0.9,
            decoration: const BoxDecoration(
                color: Colors.cyan,
                image: DecorationImage(
                    image: AssetImage(ImageUrl.incomingCall),
                    fit: BoxFit.cover)),
            child: Column(children: [
              SizedBox(
                height: height * 0.23,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.3),
                child: Image(
                  image: AssetImage(
                    ImageUrl.incomingcallProfile,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Text(
                TextString.incominCallName,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white),
              ),
              const Text(
                TextString.incominCall,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppColors.incomingCall),
              ),
              SizedBox(
                height: height * 0.23,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset(IconUrl.remainder),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          TextString.remind,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(IconUrl.messages),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          TextString.incoming_messade,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: SlideAction(
                  sliderButtonIconPadding: 19,
                  onSubmit: () async {
                    Get.to(VideoCall());
                    /*        String location = await getCurrentLocation(context: context);
                if (location.isNotEmpty) {
                  if (cubit.checkIn == null) {

                    cubit.checkInOutAttendance(location: location);
                  } else {
                    cubit.checkOutAttendance(location: location);
                  }
                } else {
                  cubit.resetSlider();
                  EasyLoading.showToast('Please enable location',
                      toastPosition: EasyLoadingToastPosition.top);
                }*/
                  },
                  innerColor: AppColors.white,
                  sliderButtonIcon: SvgPicture.asset(IconUrl.call),
                  outerColor: Colors.white30,
                  height: 70,
                  elevation: 0,
                  child: Text(
                    TextString.answer,
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
