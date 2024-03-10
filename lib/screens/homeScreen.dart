import 'package:bookclubs/model/user.dart';
import 'package:bookclubs/screens/CreateOrJoinClub/create_or_join_club.dart';
import 'package:bookclubs/screens/dmsscreen.dart';
import 'package:bookclubs/screens/mybooks.dart';
import 'package:bookclubs/screens/myclubscreen.dart';
import 'package:bookclubs/screens/notificationScreen.dart';
import 'package:bookclubs/screens/profilescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  int _selectedIndex = 0;
  
  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isInClubModel = Provider.of<IsInClub>(context, listen: false);
    bool isInClub = isInClubModel.isInClub;
    final List<Widget> _screens = isInClub
        ? const [
            MyClubPage(),
            MyBooksPage(),
            ProfileScreen(),
            DMsScreen(),
            NotificationScreen(),
          ]
        : const [
            CreateOrJoinClubScreen(),
            MyBooksPage(),
            ProfileScreen(),
            DMsScreen(),
            NotificationScreen(),
          ];

    return Scaffold(
      // appBar: AppBar(
      //   title: Consumer<UserModel>(
      //     builder: (context, userModel, child) {
      //       return Text(userModel.username);
      //     },
      //   ),
      //   centerTitle: true,
      // ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.group,
            ),
            label: 'My Club',
            backgroundColor: Colors.black87,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
            ),
            label: 'My Book',
            backgroundColor: Colors.black87,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
            backgroundColor: Colors.black87,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
            ),
            label: 'DMs',
            backgroundColor: Colors.black87,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
            ),
            label: 'Notifications',
            backgroundColor: Colors.black87,
          ),
        ],
      ),
    );
  }
}
