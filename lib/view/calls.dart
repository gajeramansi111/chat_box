import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../componets/big_text.dart';
import '../componets/small_text.dart';
import '../utility/colors.dart';
import '../utility/icon_url.dart';
import '../utility/image_url.dart';
import '../utility/text_string.dart';
import 'chat_screen.dart';

class Calls extends StatefulWidget {
  const Calls({Key? key}) : super(key: key);

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  List msg = [
    {
      "image": ImageUrl.story_3,
      "text": TextString.call1,
      "sub": TextString.callsub1
    },
    {
      "image": ImageUrl.story_3,
      "text": TextString.call2,
      "sub": TextString.callsub2
    },
    {
      "image": ImageUrl.story_1,
      "text": TextString.call3,
      "sub": TextString.callsub3
    },
    {
      "image": ImageUrl.story_2,
      "text": TextString.call4,
      "sub": TextString.callsub4
    },
    {
      "image": ImageUrl.story_3,
      "text": TextString.call5,
      "sub": TextString.callsub5
    },
    {
      "image": ImageUrl.story_1,
      "text": TextString.call6,
      "sub": TextString.callsub6
    },
    {
      "image": ImageUrl.story_3,
      "text": TextString.call5,
      "sub": TextString.callsub5
    },
    {
      "image": ImageUrl.story_1,
      "text": TextString.call6,
      "sub": TextString.callsub6
    },
  ];
  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Padding(
          padding: EdgeInsets.only(left: width * 0.04),
          child: Container(
            padding: const EdgeInsets.all(7),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.leadingBorder),
            ),
            child: SvgPicture.asset(IconUrl.serch_icon),
          ),
        ),
        title: const Text(TextString.calls,
            style: TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500)),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.04),
            child: Container(
                padding: const EdgeInsets.all(7),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.leadingBorder),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    ImageUrl.call_add,
                  ),
                )),
          ),
        ],
      ),
      body: Column(
        children: [
          Spacer(),
          Container(
            height: height / 1.28,
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.005,
                  width: width * 0.1,
                  decoration: BoxDecoration(
                      color: AppColors.smallCon,
                      borderRadius: BorderRadius.circular(2)),
                ),
                SizedBox(
                  height: height * 0.02,
                ),

                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          height: height * 0.1,
                          //   color: Colors.cyan,
                          child: ListTile(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => ChatScreen(
                              //               title: msg[index]['text'],
                              //               image: msg[index]['image'],
                              //             )));
                            },
                            // contentPadding: EdgeInsets.symmetric(
                            //     horizontal: 0.0, vertical: 0.0),
                            dense: true,
                            visualDensity:
                                VisualDensity(horizontal: 0, vertical: 4),
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(msg[index]["image"]),
                            ),
                            title: ChatName(
                              text: msg[index]["text"],
                              fontSize: 20,
                              fontweight: FontWeight.w500,
                            ),
                            subtitle: Container(
                              width: 200,
                              // color: Colors.brown,
                              child: Row(
                                children: [
                                  Icon(Icons.phone_callback,
                                      color: AppColors.incomnig, size: 16),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  SmallText(
                                      text: msg[index]["sub"], fontSize: 12),
                                ],
                              ),
                            ),
                            trailing: SizedBox(
                              //color: Colors.indigo,
                              width: 70,
                              child: Row(
                                children: [
                                  SvgPicture.asset(IconUrl.calls_deactive),
                                  SizedBox(
                                    width: width * 0.05,
                                  ),
                                  const Icon(
                                    Icons.video_camera_back_rounded,
                                    color: AppColors.callIcon,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          indent: 90,
                          color: AppColors.divider_bottom,
                        );
                      },
                      itemCount: msg.length),
                )
                // Expanded(
                //   child: ListView.builder(
                //     itemCount: msg.length,
                //     itemBuilder: (context, index) {
                //       return ListTile(
                //           contentPadding: EdgeInsets.symmetric(
                //               vertical: height * 0.01,
                //               horizontal: width * 0.05),
                //           onTap: () {
                //             // Navigator.push(
                //             //     context,
                //             //     MaterialPageRoute(
                //             //         builder: (context) => ChatScreen(
                //             //               title: msg[index]['text'],
                //             //               image: msg[index]['image'],
                //             //             )));
                //           },
                //           // contentPadding: EdgeInsets.symmetric(
                //           //     horizontal: 0.0, vertical: 0.0),
                //           visualDensity:
                //               const VisualDensity(horizontal: 0, vertical: 4),
                //           leading: CircleAvatar(
                //             radius: 30,
                //             backgroundImage: AssetImage(msg[index]["image"]),
                //           ),
                //           title: Expanded(
                //             child: ChatName(
                //               text: msg[index]["text"],
                //               fontSize: 20,
                //               fontweight: FontWeight.w500,
                //             ),
                //           ),
                //           subtitle:
                //               boldText(text: msg[index]["sub"], fontSize: 12),
                //           trailing: Row(
                //             children: [
                //               Icon(Icons.call),
                //               Icon(Icons.video_camera_back_rounded)
                //             ],
                //           ));
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
