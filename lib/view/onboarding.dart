import 'package:chat_box/view/sign_in.dart';
import 'package:chat_box/view/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../componets/button.dart';
import '../componets/container.dart';
import '../firebase_service/auth_service/google_auth.dart';
import '../utility/colors.dart';
import '../utility/icon_url.dart';
import '../utility/text_string.dart';
import 'bottmon_nav.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List image = [IconUrl.facebook, IconUrl.google, IconUrl.apple];
  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.06,
            ),
            // Stack(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(left: 15),
            //       child: Image(
            //         image: AssetImage(ImageUrl.onboardingStack),
            //         // height: height / 1,
            //         width: width,
            //       ),
            //     ),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage(IconUrl.Chatbox),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                const Text(
                  TextString.splashString,
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.06,
            ),
            RichText(
              text: const TextSpan(
                  text: TextString.onBoarding,
                  style: TextStyle(fontSize: 68, fontWeight: FontWeight.w400),
                  children: [
                    TextSpan(
                        text: TextString.onBoarding1,
                        style: TextStyle(
                            fontSize: 68, fontWeight: FontWeight.w600))
                  ]),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const Text(
              TextString.onboarding2,
              style: TextStyle(
                  color: AppColors.onBoardingtext,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: height * 0.15,
                  width: width * 0.15,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    //  color: Colors.white,
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: AppColors.containerBorder, width: 1),
                  ),
                  child: Image(
                      image: const AssetImage(IconUrl.facebook),
                      height: height * 0.01,
                      width: width * 0.01),
                ),
                SizedBox(
                  width: width * 0.05,
                ),
                InkWell(
                  onTap: () {
                    GoogleAuth.signInWithGoogle().then(
                      (value) => {
                        if (value != null) print("value===============$value"),
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BottomNav(),
                            ),
                          ),
                        }
                      },
                    );
                  },
                  child: Container(
                    height: height * 0.15,
                    width: width * 0.15,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      //  color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: AppColors.containerBorder, width: 1),
                    ),
                    child: Image(
                        image: const AssetImage(IconUrl.google),
                        height: height * 0.01,
                        width: width * 0.01),
                  ),
                ),
                SizedBox(
                  width: width * 0.05,
                ),
                Container(
                  height: height * 0.15,
                  width: width * 0.15,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    //  color: Colors.white,
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: AppColors.containerBorder, width: 1),
                  ),
                  child: Image(
                      image: const AssetImage(IconUrl.apple),
                      height: height * 0.01,
                      width: width * 0.01),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color: AppColors.divider,
                    thickness: 1,
                    endIndent: width * 0.04,
                    //  indent: width * 0.02,
                  ),
                ),
                const Text(
                  "OR",
                  style: TextStyle(color: Colors.white),
                ),
                Expanded(
                  child: Divider(
                    color: AppColors.divider,
                    thickness: 1,
                    indent: width * 0.04,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Button(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUP(),
                    ));
              },
              color: AppColors.white,
              text: TextString.signUpWithmail,
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  TextString.Existingg,
                  style: TextStyle(
                      color: AppColors.Existing, fontWeight: FontWeight.w400),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignIn(),
                        ));
                  },
                  child: const Text(
                    TextString.Login,
                    style: TextStyle(
                        color: AppColors.white, fontWeight: FontWeight.w500),
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
