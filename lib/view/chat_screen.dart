import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../componets/big_text.dart';
import '../componets/small_text.dart';
import '../utility/colors.dart';
import '../utility/icon_url.dart';
import '../utility/text_string.dart';
import 'incoming_call.dart';

class ChatScreen extends StatefulWidget {
  final String title;
  final String image;
  const ChatScreen({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}

class _ChatScreenState extends State<ChatScreen> {
  // List chat = [
  //   "Hello, sunshine! How are you? Oh, your rays are already making my day brighter!",
  //   "Hey, howdy, hi! How is it going?",
  //   "What’s kicking, little chicken?",
  //   "My name is (your name), and I am a bad, bad guy. I like you!",
  //   "Hi! At least we meet for the first time for the last time!",
  //   "Hey there, little thing. You made my day by giving me a glimpse of yourself!"
  // ];

  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];

  List bottomMenu = [
    {"Image": IconUrl.camera_bottom, "title": TextString.camera, "sub": ""},
    {
      "Image": IconUrl.doc,
      "title": TextString.documents,
      "sub": TextString.doc_sub
    },
    {
      "Image": IconUrl.creat_poll,
      "title": TextString.createPoll,
      "sub": TextString.create_sub
    },
    {
      "Image": IconUrl.media,
      "title": TextString.media,
      "sub": TextString.media
    },
    {
      "Image": IconUrl.contact,
      "title": TextString.contacts,
      "sub": TextString.contacts_sub
    },
    {
      "Image": IconUrl.location,
      "title": TextString.location,
      "sub": TextString.location_sub
    },
  ];

  final msgController = TextEditingController();
  bool isShow = false;

  List<File> selectedImages = []; // List of selected image
  final picker = ImagePicker();

  Future getImages() async {
    final pickedFile = await picker.pickMultiImage(
        imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
    List<XFile> xfilePick = pickedFile;

    if (xfilePick.isNotEmpty) {
      for (var i = 0; i < xfilePick.length; i++) {
        selectedImages.add(File(xfilePick[i].path));
      }
      setState(
        () {},
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Nothing is selected'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(widget.image),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 39, left: 35),
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor: AppColors.activeColor,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ChatName(
                        text: widget.title,
                        fontSize: 20,
                        fontweight: FontWeight.w500,
                      ),
                      const boldText(
                          text: TextString.active,
                          fontSize: 12,
                          fontweight: FontWeight.w400),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.call_outlined)),
                  IconButton(
                      onPressed: () {
                        Get.to(IncominCall());
                      },
                      icon: const Icon(Icons.video_camera_back_rounded)),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(
                        left: 14, right: 14, top: 10, bottom: 10),
                    child: Align(
                      alignment: (messages[index].messageType == "receiver"
                          ? Alignment.topLeft
                          : Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              messages[index].messageType == "receiver"
                                  ? const BorderRadius.only(
                                      topRight: Radius.circular(13),
                                      bottomRight: Radius.circular(13),
                                      bottomLeft: Radius.circular(13))
                                  : const BorderRadius.only(
                                      topLeft: Radius.circular(13),
                                      bottomRight: Radius.circular(13),
                                      bottomLeft: Radius.circular(13)),
                          color: (messages[index].messageType == "receiver"
                              ? AppColors.recevier
                              : AppColors.send),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(
                          messages[index].messageContent,
                          style: TextStyle(
                              fontSize: 15,
                              color: messages[index].messageType == "receiver"
                                  ? AppColors.bigText
                                  : AppColors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Expanded(
            //   child: SizedBox(
            //     width: 300.0, // To show images in particular area only
            //     child: selectedImages.isEmpty // If no images is selected
            //         ? SizedBox.shrink()
            //         // If atleast 1 images is selected
            //         : GridView.builder(
            //             itemCount: selectedImages.length,
            //             gridDelegate:
            //                 const SliverGridDelegateWithFixedCrossAxisCount(
            //                     crossAxisCount: 3
            //                     // Horizontally only 3 images will show
            //                     ),
            //             itemBuilder: (BuildContext context, int index) {
            //               // TO show selected file
            //               return Center(
            //                 child: Image.file(
            //                   selectedImages[index],
            //                 ),
            //               );
            //             },
            //           ),
            //   ),
            // ),
            SizedBox(
              height: 80,
              //color: Colors.yellowAccent,
              child: Row(
                children: [
                  SizedBox(
                    width: width * 0.05,
                  ),
                  InkWell(
                      onTap: () {
                        Get.bottomSheet(
                            isScrollControlled: true,
                            Container(
                              height: height * 0.72,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(40))),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.03),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            icon: const Icon(Icons.clear)),
                                        SizedBox(
                                          width: width * 0.2,
                                        ),
                                        const Text(
                                          TextString.shareContent,
                                          style: TextStyle(
                                              color: AppColors.bigText,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
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
                                                    backgroundColor:
                                                        AppColors.bottomLeading,
                                                    child: SvgPicture.asset(
                                                        bottomMenu[index]
                                                            ["Image"])),
                                                title: boldText(
                                                    text: bottomMenu[index]
                                                        ["title"],
                                                    fontSize: 14,
                                                    fontweight:
                                                        FontWeight.w600),
                                                subtitle: SmallText(
                                                    text: bottomMenu[index]
                                                        ["sub"],
                                                    fontSize: 12,
                                                    fontweight:
                                                        FontWeight.w400),
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
                            ));
                      },
                      child: SvgPicture.asset(IconUrl.attach)),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: msgController,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          isShow = true;
                        } else {
                          isShow = false;
                        }
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.textfield,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "Write your message",
                        hintStyle: const TextStyle(fontSize: 12),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset(IconUrl.file,
                              height: 15, width: 15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  isShow == false
                      ? Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  getImages();
                                },
                                child: SvgPicture.asset(IconUrl.camera)),
                            SizedBox(
                              width: width * 0.05,
                            ),
                            SvgPicture.asset(IconUrl.mic),
                          ],
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              messages.add(ChatMessage(
                                  messageContent: msgController.text,
                                  messageType: "sender"));
                              msgController.clear();
                            });
                          },
                          child: const CircleAvatar(
                              radius: 25,
                              backgroundColor: AppColors.send,
                              child: Icon(
                                Icons.send_rounded,
                                color: AppColors.white,
                              )),
                        ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
