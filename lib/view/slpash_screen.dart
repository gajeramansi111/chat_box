import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utility/text_string.dart';
import 'bottmon_nav.dart';
import 'onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? email;
  Future getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var obtained = preferences.getString("yourEmail");
    setState(() {
      email = obtained;
    });
  }

  @override
  void initState() {
    getData().whenComplete(() async {
      Timer(Duration(seconds: 2), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => email == null ? Onboarding() : BottomNav(),
            ));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: const AssetImage("assets/images/splash_with_text.png"),
              height: height * 0.5,
              width: width * 0.5,
            ),
          )
        ],
      ),
    );
  }
}
