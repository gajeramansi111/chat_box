import 'package:chat_box/view/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../componets/chat_text.dart';
import '../componets/small_text.dart';
import '../firebase_service/auth_service/email_auth.dart';
import '../utility/colors.dart';
import '../utility/icon_url.dart';
import '../utility/image_url.dart';
import '../utility/text_string.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  List icon = [
    IconUrl.msg_deactive,
    IconUrl.msgVcall,
    IconUrl.callIcon,
    IconUrl.more_horizontal
  ];

  List story = [
    ImageUrl.profile,
    ImageUrl.story_1,
    ImageUrl.story_2,
    ImageUrl.story_3,
    ImageUrl.story_4,
  ];

  List text = [
    {"small": TextString.displayName, 'big': TextString.call2},
    {"small": TextString.emailAddress, 'big': TextString.emailId},
    {"small": TextString.address, 'big': TextString.addressId},
    {"small": TextString.phoneNumber, 'big': TextString.Number},
  ];
  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.025,
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_rounded),
            color: AppColors.white,
          ),
          const Center(
            child: Image(
              image: AssetImage(ImageUrl.story_1),
              height: 82,
              width: 82,
            ),
          ),
          SizedBox(
            height: height * 0.015,
          ),
          const Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                whiteText(
                  text: TextString.call5,
                  fontSize: 20,
                  fontweight: FontWeight.w600,
                ),
                Text(
                  TextString.email,
                  style: TextStyle(color: AppColors.smallText),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: SizedBox(
              height: height * 0.1,
              // color: Colors.lightGreenAccent,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    child: InkWell(
                      onTap: () async {
                        switch (index) {
                          case 3:
                            SharedPreferences pref =
                                await SharedPreferences.getInstance();
                            pref.remove("yourEmail");
                            EmailAuthService.signOut()
                                .then((value) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignIn(),
                                    )));

                            break;
                        }
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColors.setting,
                        child:
                            SvgPicture.asset(icon[index], color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const Spacer(),
          Container(
            height: height * 0.62,
            width: width,
            decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.013,
                  ),
                  Container(
                    height: height * 0.005,
                    width: width * 0.1,
                    decoration: BoxDecoration(
                        color: AppColors.smallCon,
                        borderRadius: BorderRadius.circular(2)),
                  ),
                  Container(
                    height: height * 0.4,
                    // color: Colors.cyan,
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return ListTile(
                          dense: true,
                          visualDensity: const VisualDensity(vertical: 3),
                          title: SmallText(
                            text: text[index]['small'],
                            fontSize: 14,
                          ),
                          subtitle: boldText(
                            text: text[index]['big'],
                            fontSize: 18,
                            fontweight: FontWeight.w500,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallText(
                        text: TextString.mediaShared,
                        fontSize: 14,
                      ),
                      Text(
                        TextString.viewAll,
                        style: TextStyle(
                            color: AppColors.send,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.013,
                  ),
                  SizedBox(
                    height: height * 0.12,
                    // color: Colors.cyan,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: story.length,
                      itemBuilder: (context, index) {
                        return index == 0 || index == 1 || index == 2
                            ? Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: width * 0.03),
                                height: height * 0.2,
                                width: width * 0.23,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    // color: Colors.indigo,
                                    image: DecorationImage(
                                        image: AssetImage(story[index]),
                                        fit: BoxFit.cover)),
                              )
                            : SizedBox();
                        // Container(
                        //         margin: EdgeInsets.symmetric(
                        //             horizontal: width * 0.03),
                        //         height: height * 0.2,
                        //         width: width * 0.23,
                        //         decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(16),
                        //             color: Colors.indigo),
                        //       );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
