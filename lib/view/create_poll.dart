import 'package:chat_box/view/poll/poll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polls/flutter_polls.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import '../componets/small_text.dart';
import '../utility/colors.dart';
import '../utility/icon_url.dart';
import '../utility/image_url.dart';
import '../utility/text_string.dart';

class CreatePoll extends StatefulWidget {
  const CreatePoll({Key? key}) : super(key: key);

  @override
  State<CreatePoll> createState() => _CreatePollState();
}

class _CreatePollState extends State<CreatePoll> {
  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const boldText(
                  text: TextString.createPoll,
                  fontSize: 22,
                  fontweight: FontWeight.w600,
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.white,
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.close)),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.035,
            ),
            const Text(
              TextString.likeWork,
              style: TextStyle(
                  fontSize: 40, fontWeight: FontWeight.w500, height: 1.3),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Container(
              height: height * 0.4,
              width: width,
              //color: Colors.black,
              // padding: const EdgeInsets.all(20),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: polls().length,
                itemBuilder: (BuildContext context, int index) {
                  final Map<String, dynamic> poll = polls()[index];

                  // final int days = DateTime(
                  //   poll['end_date'].year,
                  //   poll['end_date'].month,
                  //   poll['end_date'].day,
                  // )
                  //     .difference(DateTime(
                  //       DateTime.now().year,
                  //       DateTime.now().month,
                  //       DateTime.now().day,
                  //     ))
                  //     .inDays;

                  return SizedBox(
                    height: 350,
                    width: width,
                    // color: Colors.cyan,
                    //  margin: const EdgeInsets.only(bottom: 20),
                    child: FlutterPolls(
                      pollId: poll['id'].toString(),
                      // hasVoted: hasVoted.value,
                      // userVotedOptionId: userVotedOptionId.value,
                      onVoted:
                          (PollOption pollOption, int newTotalVotes) async {
                        await Future.delayed(const Duration(seconds: 1));

                        return true;
                      },
                      pollOptionsHeight: 80,
                      heightBetweenOptions: 25,
                      pollOptionsFillColor: Colors.white,
                      votedPollOptionsRadius: const Radius.circular(16),
                      pollOptionsBorderRadius: BorderRadius.circular(16),
                      voteInProgressColor: Colors.white,
                      votedProgressColor: AppColors.selected,
                      votedBackgroundColor: Colors.white,

                      pollTitle: Container(),
                      pollOptions: List<PollOption>.from(
                        poll['options'].map(
                          (option) {
                            var b = PollOption(
                              id: option['id'],
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    option['title'],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff797C7B),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    option['subTitle'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  )
                                ],
                              ),
                              votes: option['votes'],
                            );
                            return b;
                          },
                        ),
                      ),
                      // votedPercentageTextStyle: const TextStyle(
                      //   fontSize: 14,
                      //   fontWeight: FontWeight.w600,
                      // ),
                      // metaWidget: Row(
                      //   children: [
                      //     const SizedBox(width: 6),
                      //     const Text(
                      //       '•',
                      //     ),
                      //     const SizedBox(
                      //       width: 6,
                      //     ),
                      //     Text(
                      //       days < 0 ? "ended" : "ends $days days",
                      //     ),
                      //   ],
                      // ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            const SmallText(
              text: TextString.votedMember,
              fontSize: 16,
              fontweight: FontWeight.w500,
            ),
            Row(
              children: [
                Container(
                  height: height * 0.13,
                  width: width * 0.13,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      image:
                          DecorationImage(image: AssetImage(ImageUrl.invite1))),
                ),
                Padding(
                  padding: EdgeInsets.only(right: width * 0.01),
                  child: Container(
                    height: height * 0.13,
                    width: width * 0.13,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white),
                        image: const DecorationImage(
                            image: AssetImage(ImageUrl.invite2))),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
