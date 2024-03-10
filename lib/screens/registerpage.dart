import 'package:bookclubs/screens/registerpage.dart';
import 'package:bookclubs/screens/signuppage.dart';
import 'package:bookclubs/services/apiServices.dart';
import 'package:bookclubs/utils/text.dart';
import 'package:bookclubs/widgets/colors.dart';
import 'package:bookclubs/widgets/textfield.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5.h),
          child: Column(
            children: [
              Container(
                child: Text(
                  "Create Your Account",
                  style: MyText.heading1,
                ),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black45,
                margin: const EdgeInsets.symmetric(vertical: 8),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  margin: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
                  child: CustomTextField(
                    "Your Email",
                    emailController,
                    const Icon(Icons.email),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  margin: EdgeInsets.only(left: 5.w, right: 5.w),
                  child: CustomTextField(
                    "Your Username",
                    usernameController,
                    const Icon(Icons.person),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  margin: EdgeInsets.only(left: 5.w, right: 5.w),
                  child: CustomTextField(
                    "Password",
                    passwordController,
                    const Icon(Icons.key),
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MyColor.brownColor),
                  onPressed: () {
                    apiServices.registerUser(usernameController.text,
                        emailController.text, passwordController.text);
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 1.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have a Bookclubs Account?",
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      child: Text(
                        " Sign In",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2.h),
                height: 5.h,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 4.h,
                        child: SvgPicture.asset('assets/icons/google.svg'),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        "Continue with Google",
                        style: TextStyle(color: Colors.black, fontSize: 13.sp),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2.h),
                height: 5.h,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 4.h,
                        child: SvgPicture.asset('assets/icons/facebook.svg'),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        "Continue with FaceBook",
                        style: TextStyle(color: Colors.black, fontSize: 13.sp),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 23.2.h,
                child: Image.asset(
                  "assets/logo/logo.png",
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
