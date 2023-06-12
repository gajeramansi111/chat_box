import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../componets/big_text.dart';
import '../componets/button.dart';

import '../componets/small_text.dart';
import '../componets/textfield.dart';
import '../firebase_service/auth_service/email_auth.dart';
import '../firebase_service/auth_service/google_auth.dart';
import '../getx/sign_up.dart';
import '../utility/colors.dart';
import '../utility/icon_url.dart';
import '../utility/text_string.dart';
import 'bottmon_nav.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final yourEmail = TextEditingController();
  final password = TextEditingController();

  bool color = false;
  final formKey = GlobalKey<FormState>();

  bool show = false;

  bool validateEmail(String email) {
    // Regular expression pattern for email validation
    String emailPattern = r'^[\w-]+(\.[\w-]+)*@([a-z0-9A-Z-]+\.)+[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }

  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: AppColors.bigText,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(children: [
          SizedBox(
            height: height * 0.03,
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 19),
                child: Container(
                  height: height * 0.012,
                  width: width * 0.14,
                  color: AppColors.container,
                ),
              ),
              const ChatName(
                text: TextString.logInChatBox,
              ),
            ],
          ),
          SizedBox(
            height: height * 0.025,
          ),
          const boldText(
            text: TextString.loginSocial,
            textalign: TextAlign.center,
            fontSize: 14,
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
                  border: Border.all(color: AppColors.bigText, width: 1),
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
                  GoogleAuth.signInWithGoogle().then((value) => {
                        if (value != null) print("value===============$value"),
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BottomNav(),
                            ),
                          ),
                        }
                      });
                },
                child: Container(
                  height: height * 0.15,
                  width: width * 0.15,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    //  color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.bigText, width: 1),
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
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  //  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.bigText, width: 1),
                ),
                child: Image(
                    image: const AssetImage(
                      IconUrl.apple,
                    ),
                    color: Colors.black,
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
              const boldText(
                  text: "OR", fontSize: 14, fontweight: FontWeight.w400),
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
            height: height * 0.025,
          ),
          Expanded(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CommonTextField(
                    labletext: TextString.Youremail,
                    controller: yourEmail,
                    onChange: (value) {
                      if (value.isNotEmpty) {
                        color = true;
                      } else {
                        color = false;
                      }
                      setState(() {});
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter email";
                      } else if (!validateEmail(value)) {
                        return "Please enter valid email.";
                      }
                      return null; // Return null for no validation error
                    },
                  ),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  CommonTextField(
                    labletext: TextString.password,
                    controller: password,
                    obsecure: true,
                    onChange: (value) {
                      if (value.isNotEmpty) {
                        color = true;
                      } else {
                        color = false;
                      }
                      setState(() {});
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "password can't Empty";
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          Button(
            text: TextString.Login,
            color: color == false ? AppColors.deActive : AppColors.send,
            textColor: color == false ? AppColors.smallText : AppColors.white,
            onTap: () async {
              if (formKey.currentState!.validate()) {
                SharedPreferences pref = await SharedPreferences.getInstance();

                EmailAuthService.signInUser(
                        email: yourEmail.text, password: password.text)
                    .then((value) {
                  if (value != null) {
                    // CollectionReference collRef =
                    //     FirebaseFirestore.instance.collection("User");
                    // collRef.doc(value.user?.uid).set({
                    //   "name": name.text,
                    //   "email": email.text,
                    //   "password": password.text,
                    //   "uid": value.user?.uid
                    // });
                    pref.setString("yourEmail", yourEmail.text);
                    pref.setString("yourPassword", password.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomNav(),
                        ));
                  } else {
                    Fluttertoast.showToast(msg: "Invalid Email or Password");
                  }
                });
              }
            },
          ),
          SizedBox(
            height: height * 0.015,
          ),
          TextButton(
            onPressed: () async {
              EmailAuthService.resetPassword(email: yourEmail.text);
            },
            child: const Text(
              TextString.forgotPassword,
              style: TextStyle(
                  color: AppColors.lableText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
        ]),
      ),
    );
  }
}
