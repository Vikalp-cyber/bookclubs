import 'package:bookclubs/model/club.dart';
import 'package:bookclubs/model/user.dart';
import 'package:bookclubs/screens/tabScreen/about.dart';
import 'package:bookclubs/screens/tabScreen/members.dart';
import 'package:bookclubs/utils/text.dart';
import 'package:bookclubs/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyClubPage extends StatefulWidget {
  const MyClubPage({super.key});

  @override
  State<MyClubPage> createState() => _MyClubPageState();
}

class _MyClubPageState extends State<MyClubPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<UserModel>(
            builder: (context, user, child) {
              return Text(
                user.username,
                style: MyText.heading1,
              );
            },
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40.0),
            child: Container(
              decoration:
                  BoxDecoration(color: MyColor.brownColor.withOpacity(0.6)),
              child: const TabBar(
                labelColor: Colors.black,
                isScrollable: true,
                indicatorColor: Colors.black, // Customize indicator color
                tabs: [
                  Tab(
                    text: 'About',
                  ),
                  Tab(
                    text: 'Members',
                  ),
                  Tab(
                    text: 'Currently Reading',
                  ),
                  Tab(text: 'Meetings'),
                  Tab(text: 'Polls'),
                  Tab(text: 'Club Messages'),
                  Tab(text: 'Books We\'ve Read'),
                  Tab(text: 'Books We Want To Read'),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            // Content for Currently Reading tab
            About(),
            Members(),
            Center(
              child: Text('Currently Reading Content'),
            ),
            // Content for Meetings tab
            Center(
              child: Text('Meetings Content'),
            ),
            // Content for Polls tab
            Center(
              child: Text('Polls Content'),
            ),
            // Content for Club Messages tab
            Center(
              child: Text('Club Messages Content'),
            ),
            // Content for Books We've Read tab
            Center(
              child: Text('Books We\'ve Read Content'),
            ),
            // Content for Books We Want To Read tab
            Center(
              child: Text('Books We Want To Read Content'),
            ),
          ],
        ),
      ),
    );
  }
}
