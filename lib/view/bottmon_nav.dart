import 'package:chat_box/view/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utility/colors.dart';
import '../utility/icon_url.dart';
import '../utility/text_string.dart';
import 'calls.dart';
import 'contacts.dart';
import 'home.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selected = 0;

  List Screen = [
    const Home(),
    const Calls(),
    const Contacts(),
    const Setting()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              selected = value;
            });
          },
          currentIndex: selected,
          selectedItemColor: AppColors.lableText,
          showSelectedLabels: true,
          selectedLabelStyle: TextStyle(
              color: AppColors.lableText,
              fontSize: 16,
              fontWeight: FontWeight.w500),
          unselectedLabelStyle: TextStyle(
              color: AppColors.smallText,
              fontSize: 16,
              fontWeight: FontWeight.w400),
          unselectedItemColor: Colors.grey,
          selectedIconTheme: IconThemeData(color: AppColors.lableText),
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconUrl.msg_deactive),
              activeIcon: SvgPicture.asset(IconUrl.msg_active),
              label: TextString.message,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconUrl.calls_deactive),
              activeIcon: SvgPicture.asset(IconUrl.calls_active),
              label: TextString.callls,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconUrl.user_deactive),
              activeIcon: SvgPicture.asset(IconUrl.user_active),
              label: TextString.contacts,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconUrl.setting_deactive),
              activeIcon: SvgPicture.asset(IconUrl.setting_active),
              label: TextString.setting,
            ),
          ]),
      body: Screen[selected],
    );
  }
}
