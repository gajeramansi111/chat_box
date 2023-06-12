import 'package:chat_box/view/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../componets/chat_text.dart';
import '../componets/small_text.dart';
import '../utility/colors.dart';
import '../utility/icon_url.dart';
import '../utility/image_url.dart';
import '../utility/text_string.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  List bottomMenu = [
    {
      "Image": IconUrl.key,
      "title": TextString.account,
      "sub": TextString.accountSub
    },
    {
      "Image": IconUrl.msg_deactive,
      "title": TextString.chat,
      "sub": TextString.chatSub
    },
    {
      "Image": IconUrl.notifation,
      "title": TextString.notifation,
      "sub": TextString.notifationSub
    },
    {
      "Image": IconUrl.help,
      "title": TextString.help,
      "sub": TextString.helpSub
    },
    {
      "Image": IconUrl.data,
      "title": TextString.storage,
      "sub": TextString.storageSub
    },
    {"Image": IconUrl.user, "title": TextString.invite, "sub": ""},
  ];
  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_rounded),
            color: Colors.white),
        title: whiteText(
            text: TextString.setting,
            fontSize: 20,
            fontweight: FontWeight.w500),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Spacer(),
          Container(
            height: height / 1.3,
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
                  height: height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: ListTile(
                    leading: InkWell(
                        onTap: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const UserProfile(),
                              ));
                        },
                        child:
                            const Image(image: AssetImage(ImageUrl.profile))),
                    title: const boldText(
                        text: TextString.nazrul,
                        fontSize: 20,
                        fontweight: FontWeight.w600),
                    subtitle: const SmallText(
                        text: TextString.neverGive,
                        fontSize: 12,
                        fontweight: FontWeight.w400),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.qr_code_2_outlined,
                          color: AppColors.lableText,
                          size: 25,
                        )),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: bottomMenu.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                                radius: 30,
                                backgroundColor: AppColors.bottomLeading,
                                child: SvgPicture.asset(
                                    bottomMenu[index]["Image"])),
                            title: boldText(
                                text: bottomMenu[index]["title"],
                                fontSize: 14,
                                fontweight: FontWeight.w600),
                            subtitle: SmallText(
                                text: bottomMenu[index]["sub"],
                                fontSize: 12,
                                fontweight: FontWeight.w400),
                          ),
                          Divider(
                            color: AppColors.divider_bottom,
                            indent: width * 0.23,
                          )
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
