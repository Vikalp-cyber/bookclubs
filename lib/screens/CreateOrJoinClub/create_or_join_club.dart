import 'package:bookclubs/screens/CreateOrJoinClub/createclub.dart';
import 'package:bookclubs/screens/CreateOrJoinClub/joinClub.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class CreateOrJoinClubScreen extends StatefulWidget {
  const CreateOrJoinClubScreen({super.key});

  @override
  State<CreateOrJoinClubScreen> createState() => _CreateOrJoinClubScreenState();
}

class _CreateOrJoinClubScreenState extends State<CreateOrJoinClubScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
              height: MediaQuery.of(context).size.width / 2,
              child: SvgPicture.asset(
                "assets/svg/Reading_book.svg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            child: const Text("You aren't a member of any clubs"),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateClub(),
                  ),
                );
              },
              child: const Text(
                "Create a Club",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const JoinClubScreen(),
                  ),
                );
              },
              child: const Text(
                "Join a Club",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
