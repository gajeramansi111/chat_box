import 'package:flutter/material.dart';

class ChatsHome extends StatefulWidget {
  const ChatsHome({Key? key}) : super(key: key);

  @override
  State<ChatsHome> createState() => _ChatsHomeState();
}

class _ChatsHomeState extends State<ChatsHome> {
  Map<String, dynamic>? userMap;

  bool isLoading = false;
  final TextEditingController serch = TextEditingController();

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
