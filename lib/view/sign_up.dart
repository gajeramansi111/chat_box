import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../componets/big_text.dart';
import '../componets/button.dart';
import '../componets/small_text.dart';
import '../componets/textfield.dart';
import '../firebase_service/auth_service/email_auth.dart';
import '../utility/colors.dart';
import '../utility/text_string.dart';
import 'bottmon_nav.dart';

class SignUP extends StatefulWidget {
  const SignUP({Key? key}) : super(key: key);

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  final yourEmail = TextEditingController();
  final password = TextEditingController();
  final yourName = TextEditingController();
  final confirmPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool color = false;

  bool validateEmail(String email) {
    // Regular expression pattern for email validation
    String emailPattern = r'^[\w-]+(\.[\w-]+)*@([a-z0-9A-Z-]+\.)+[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }

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
        child: Column(
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 19),
                  child: Container(
                    height: height * 0.012,
                    width: width * 0.16,
                    color: AppColors.container,
                  ),
                ),
                const ChatName(
                  text: TextString.signInEmail,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.025,
            ),
            const boldText(
              text: TextString.withEmail,
              textalign: TextAlign.center,
              fontSize: 14,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Expanded(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CommonTextField(
                      labletext: TextString.yourName,
                      controller: yourName,

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
                          return "Your name can't Empty";
                        }
                      },
                      // controller: yourEmail,
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    CommonTextField(
                      labletext: TextString.Youremail,
                      onChange: (value) {
                        if (value.isNotEmpty) {
                          color = true;
                        } else {
                          color = false;
                        }
                        setState(() {});
                      },
                      controller: yourEmail,
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
                      onChange: (value) {
                        if (value.isNotEmpty) {
                          color = true;
                        } else {
                          color = false;
                        }
                        setState(() {});
                      },
                      obsecure: true,
                      validator: (PassCurrentValue) {
                        RegExp regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                        var passNonNullValue = PassCurrentValue ?? "";
                        if (passNonNullValue.isEmpty) {
                          return ("Password is required");
                        } else if (passNonNullValue.length < 8) {
                          return ("Password Must be more than 8 characters");
                        } else if (!regex.hasMatch(passNonNullValue)) {
                          return ("Password should contain upper,lower,digit and Special character ");
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    CommonTextField(
                      labletext: TextString.confrimPassword,
                      controller: confirmPassword,
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
                        print("value==================>>>>>>>>>>>$value");
                        if (password.text != confirmPassword.text) {
                          return "password must be match";
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Button(
              text: TextString.creatAccount,
              color: color == false ? AppColors.deActive : AppColors.send,
              textColor: color == false ? AppColors.smallText : AppColors.white,
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  EmailAuthService.signUpUser(
                          email: yourEmail.text, password: password.text)
                      .then(
                    (value) {
                      if (value != null) {
                        pref.setString('yourEmail', yourEmail.text);
                        pref.setString('yourPassword', password.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BottomNav(),
                            ));
                      } else {
                        Fluttertoast.showToast(
                            msg: "Invalid Email or Password");
                      }
                    },
                  );
                }
              },
            ),
            SizedBox(
              height: height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
