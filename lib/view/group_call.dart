import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../componets/chat_text.dart';
import '../utility/colors.dart';
import '../utility/icon_url.dart';
import '../utility/image_url.dart';
import '../utility/text_string.dart';

class GroupCall extends StatefulWidget {
  const GroupCall({Key? key}) : super(key: key);

  @override
  State<GroupCall> createState() => _GroupCallState();
}

class _GroupCallState extends State<GroupCall> {
  List chat = [
    {
      "image": ImageUrl.invite1,
      "text": TextString.liveChat,
      "sub": TextString.liveChatSub
    },
    {
      "image": ImageUrl.invite2,
      "text": TextString.liveChat1,
      "sub": TextString.liveChatSub1
    },
    {
      "image": ImageUrl.invite3,
      "text": TextString.liveChat2,
      "sub": TextString.liveChatSub2
    },
  ];
  List mute = [
    ImageUrl.muteOne,
    ImageUrl.muteTwo,
    ImageUrl.muteThree,
    ImageUrl.muteFour,
    ImageUrl.muteFour,
  ];

  List invited = [
    ImageUrl.invite1,
    ImageUrl.invite2,
    ImageUrl.invite3,
    ImageUrl.invite4,
    ImageUrl.invite5,
  ];

  List videoCall = [
    {"icon": IconUrl.audio, "color": Colors.black54},
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
      body: Column(
        children: [
          Container(
            height: height / 1.15,
            width: width,
            decoration: const BoxDecoration(
                color: Colors.lightGreen,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30)),
                image: DecorationImage(
                    image: AssetImage(ImageUrl.groupBack), fit: BoxFit.cover)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.06,
                  ),
                  const whiteText(
                    text: TextString.meeting,
                    fontSize: 40,
                    fontweight: FontWeight.w600,
                    height: 1.2,
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Row(
                    children: [
                      const Image(
                        image: AssetImage(ImageUrl.meeting),
                        height: 50,
                        width: 50,
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          whiteText(
                            text: TextString.meet_maam,
                            fontSize: 16,
                            fontweight: FontWeight.w600,
                          ),
                          Text(TextString.organatizer,
                              style: TextStyle(
                                  color: AppColors.vcallsmalltext,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.2,
                  ),
                  Container(
                    height: height * 0.3,
                    //  color: Colors.cyan,
                    child: ListView.builder(
                      itemCount: chat.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 20,

                            //   Image(image: AssetImage(chat[index]["image"])),
                          ),
                          title: whiteText(
                              text: chat[index]['text'],
                              fontSize: 14,
                              fontweight: FontWeight.w600),
                          subtitle:
                              whiteText(text: chat[index]['sub'], fontSize: 14),
                        );
                      },
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: height * 0.08,
                    // color: Colors.cyan,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: width * 0.025),
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
                        );
                      },
                    ),
                    // ),
                    // Expanded(
                    //     child: CircleAvatar(
                    //         radius: 25, backgroundColor: AppColors.callCut))
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.028,
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            height: 80,
            //  color: Colors.cyan,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Image(image: AssetImage(invited[index])),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.1, top: height * 0.03),
                        child: Container(
                          height: height * 0.05,
                          width: width * 0.05,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white, width: 2.5),

                              // color: AppColors.smallCon,
                              shape: BoxShape.circle),
                          child: Container(
                              height: height * 0.04,
                              width: width * 0.04,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.grey.shade500,
                                        Colors.grey.shade200,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                  color: AppColors.smallCon,
                                  shape: BoxShape.circle),
                              child: const Icon(Icons.mic_off_outlined,
                                  size: 16, color: AppColors.white)),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
