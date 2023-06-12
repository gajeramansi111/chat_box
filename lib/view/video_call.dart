import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../utility/colors.dart';
import '../utility/icon_url.dart';
import '../utility/image_url.dart';
import 'bottmon_nav.dart';

class VideoCall extends StatefulWidget {
  const VideoCall({Key? key}) : super(key: key);

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  List videoCall = [
    {"icon": IconUrl.mic, "color": Colors.black54},
    {"icon": IconUrl.specker, "color": Colors.black54},
    {"icon": IconUrl.camera_bottom, "color": Colors.black54},
    {"icon": IconUrl.msgVcall, "color": AppColors.send},
    {"icon": IconUrl.close, "color": AppColors.callCut},
  ];
  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageUrl.videoCAll), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              left: width * 0.05, right: width * 0.05, top: height * 0.07),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(const BottomNav());
                    },
                    child: const Icon(Icons.arrow_back_rounded),
                  ),
                  const Image(
                    image: AssetImage(ImageUrl.videoCAll2),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                height: height * 0.08,
                // color: Colors.cyan,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.025),
                        height: height * 0.13,
                        width: width * 0.13,
                        decoration: BoxDecoration(
                            color: videoCall[index]["color"],
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: SvgPicture.asset(
                            videoCall[index]["icon"],
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                // ),
                // Expanded(
                //     child: CircleAvatar(
                //         radius: 25, backgroundColor: AppColors.callCut))
              ),
              SizedBox(
                height: height * 0.02,
              )
            ],
          ),
        ),
      ),
    );
  }
}
