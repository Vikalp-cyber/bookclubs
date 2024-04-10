import 'package:bookclubs/utils/text.dart';
import 'package:bookclubs/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 15.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: MyColor.brownColor,
            ),
            child: Stack(
              children: [
                GestureDetector(
                  child: Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Upload",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          ProfileAndName(),
          SizedBox(
            height: 2.h,
          ),
          Container(
            child: Row(
              children: [
                Text(
                  "SHORT DESCRIPTION",
                  style: MyText.h2,
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            child: Row(
              children: [
                Text(
                  "ABOUT US",
                  style: MyText.h2,
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            child: Row(
              children: [
                Text(
                  "LOCATION",
                  style: MyText.h2,
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "delete club",
                  style: TextStyle(color: Colors.red, fontSize: 15.sp),
                )),
          )
        ],
      ),
    );
  }

  Container ProfileAndName() {
    return Container(
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
          ),
          SizedBox(
            width: 3.h,
          ),
          Column(
            children: [
              Text(
                "Club Name",
                style: MyText.h2,
              ),
              Row(
                children: [
                  const Icon(Icons.group),
                  SizedBox(
                    width: 2.w,
                  ),
                  const Text("Members"),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
