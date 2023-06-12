import 'package:chat_box/view/poll/poll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polls/flutter_polls.dart';

class ExamplePolls extends StatefulWidget {
  const ExamplePolls({Key? key}) : super(key: key);

  @override
  State<ExamplePolls> createState() => _ExamplePollsState();
}

class _ExamplePollsState extends State<ExamplePolls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Polls '),
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
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

            return Container(
              height: 500,
              width: 400,
              //color: Colors.cyan,
              //  margin: const EdgeInsets.only(bottom: 20),
              child: FlutterPolls(
                pollId: poll['id'].toString(),
                // hasVoted: hasVoted.value,
                // userVotedOptionId: userVotedOptionId.value,
                onVoted: (PollOption pollOption, int newTotalVotes) async {
                  await Future.delayed(const Duration(seconds: 1));

                  /// If HTTP status is success, return true else false
                  return true;
                },
                pollOptionsHeight: 80,
                heightBetweenOptions: 20,
                pollOptionsFillColor: Color(0xff8DEEE2),
                votedPollOptionsRadius: Radius.circular(16),
                pollTitle: Container(),
                pollOptions: List<PollOption>.from(
                  poll['options'].map(
                    (option) {
                      var a = PollOption(
                        id: option['id'],
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              option['title'],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              option['subTitle'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 10),
                            )
                          ],
                        ),
                        votes: option['votes'],
                      );
                      return a;
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
    );
  }
}
