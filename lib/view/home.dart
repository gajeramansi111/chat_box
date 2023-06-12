import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../componets/big_text.dart';
import '../componets/chat_text.dart';
import '../componets/small_text.dart';
import '../utility/colors.dart';
import '../utility/icon_url.dart';
import '../utility/image_url.dart';
import '../utility/text_string.dart';
import 'chat_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List story = [
    {"image": ImageUrl.profile, "text": TextString.myStatus},
    {"image": ImageUrl.story_1, "text": TextString.adil},
    {"image": ImageUrl.story_2, "text": TextString.marina},
    {"image": ImageUrl.story_3, "text": TextString.dean},
    {"image": ImageUrl.story_4, "text": TextString.max},
  ];
  List msg = [
    {
      "image": ImageUrl.story_3,
      "text": TextString.chat_1,
      "sub": TextString.sub_1
    },
    {
      "image": ImageUrl.story_3,
      "text": TextString.chat_2,
      "sub": TextString.sub_2
    },
    {
      "image": ImageUrl.story_1,
      "text": TextString.chat_3,
      "sub": TextString.sub_3
    },
    {
      "image": ImageUrl.story_2,
      "text": TextString.chat_4,
      "sub": TextString.sub_4
    },
    {
      "image": ImageUrl.story_4,
      "text": TextString.chat_5,
      "sub": TextString.sub_5
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
        leading: Container(
          padding: const EdgeInsets.all(13),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.leadingBorder),
          ),
          child: SvgPicture.asset(IconUrl.serch_icon),
        ),
        title: const Text(TextString.home,
            style: TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500)),
        centerTitle: true,
        actions: const [Image(image: AssetImage(ImageUrl.profile))],
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.06,
          ),
          SizedBox(
            height: height * 0.13,
            //  color: Colors.cyan,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: story.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: width * 0.023),
                          height: 75,
                          padding: const EdgeInsets.all(2),
                          width: 75,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: AppColors.white, width: 2),
                          ),
                          child: Container(
                            //  padding: EdgeInsets.all(8),

                            decoration: BoxDecoration(
                                color: Colors.brown,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(story[index]["image"]))),
                          ),
                        ),
                        index == 0
                            ? Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.15, top: height * 0.065),
                                child: const CircleAvatar(
                                  radius: 10,
                                  backgroundColor: AppColors.white,
                                  child: Center(
                                      child: Icon(
                                    Icons.add,
                                    size: 17,
                                  )),
                                ),
                              )
                            : const SizedBox.shrink()
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Expanded(
                        child:
                            whiteText(text: story[index]["text"], fontSize: 14))
                  ],
                );
              },
            ),
          ),
          const Spacer(),
          Container(
            height: height / 1.7,
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
                  child: ListView.builder(
                    itemCount: msg.length,
                    itemBuilder: (context, index) {
                      return Slidable(
                        key: ValueKey("$msg"),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              // An action can be bigger than the others.
                              flex: 2,
                              onPressed: (context) {},
                              backgroundColor: AppColors.tilebackground,
                              foregroundColor: AppColors.bigText,

                              icon: Icons.notifications_active_outlined,
                            ),
                            SlidableAction(
                              // An action can be bigger than the others.
                              flex: 2,
                              //  borderRadius: BorderRadius.circular(300),
                              onPressed: (context) {
                                setState(() {
                                  msg.removeAt(index);
                                });
                              },
                              backgroundColor: AppColors.tilebackground,
                              foregroundColor: Colors.black,
                              icon: Icons.delete_outline,
                              // label: 'Archive',
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: height * 0.01,
                              horizontal: width * 0.05),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatScreen(
                                          title: msg[index]['text'],
                                          image: msg[index]['image'],
                                        )));
                          },
                          // contentPadding: EdgeInsets.symmetric(
                          //     horizontal: 0.0, vertical: 0.0),

                          selectedTileColor: AppColors.tilebackground,
                          visualDensity:
                              const VisualDensity(horizontal: 0, vertical: 4),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(msg[index]["image"]),
                          ),
                          title: ChatName(
                            text: msg[index]["text"],
                            fontSize: 20,
                            fontweight: FontWeight.w500,
                          ),
                          subtitle:
                              boldText(text: msg[index]["sub"], fontSize: 12),
                          trailing: const Column(
                            children: [
                              boldText(text: "2 min ago", fontSize: 12),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
