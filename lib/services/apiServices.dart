import 'dart:convert';

import 'package:bookclubs/model/book.dart';
import 'package:bookclubs/model/club.dart';
import 'package:bookclubs/model/clubAdmin.dart';
import 'package:bookclubs/model/meeting.dart';
import 'package:bookclubs/model/member.dart';
import 'package:bookclubs/model/user.dart';
import 'package:bookclubs/screens/CreateOrJoinClub/create_or_join_club.dart';
import 'package:bookclubs/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ApiServices {
  Future<void> loginUser(
      String username, String password, BuildContext context) async {
    // const String apiUrl = "http://vkp18.pythonanywhere.com/login";
    final response = await http.post(
      Uri.parse("http://vkp18.pythonanywhere.com/login"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'username': username,
        'password': password,
      }),
    );

    print('Response Status Code: ${response.statusCode}');
    // print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      try {
        final userData = json.decode(response.body)["user"];
        // Store the user information using Provider
        Provider.of<UserModel>(context, listen: false).setUser(
          userId: userData["id"],
          email: userData["email"],
          username: userData["username"],
          
        );

        print('Login Successful');
        print(userData);
        await isIntheClub(context);
      } catch (e) {
        // If decoding fails, print an error message
        print('Error decoding JSON: $e');
      }
    } else {
      // Handle login failure, show an error message or retry
      print('Login Failed');
    }
  }

  Future<void> registerUser(
      String username, String email, String password) async {
    final response = await http.post(
      Uri.parse("http://vkp18.pythonanywhere.com/register"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'username': username,
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 201) {
      try {
        final r = json.decode(response.body);
        // Successful login, handle the response as needed
        print('Register Successful');
        print(response.body);
        print(r);
      } catch (e) {
        // If decoding fails, print an error message
        print('Error decoding JSON: $e');
      }
    } else {
      // Handle login failure, show an error message or retry
      print('Register Failed');
      print(response.body);
      print(response.statusCode);
    }
  }

  Future<void> isIntheClub(BuildContext context) async {
    final userModel = Provider.of<UserModel>(context, listen: false);
    final userId = userModel.userId;

    if (userId == null) {
      // Handle the case when user ID is not available
      return;
    }

    final url =
        Uri.parse('http://vkp18.pythonanywhere.com/user/$userId/is-in-club');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final bool isInClub = data['is_in_club'];
        print(isInClub);
        if(isInClub){
          Provider.of<IsInClub>(context, listen: false)
            .setIsInClub(isInClub: data['is_in_club'], clubId: data['club_id']);
          clubDetails(context);
        }
        else{
          Provider.of<IsInClub>(context, listen: false)
            .setIsInClub(isInClub: data['is_in_club']);
        }
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } else {
        // Handle HTTP error
        print('Error fetching isIntheClub data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network or other errors
      print('Error fetching isIntheClub data: $e');
    }
  }

  Future<void> createClub(String clubName, BuildContext context) async {
    final userModel = Provider.of<UserModel>(context, listen: false);
    final isInClub = Provider.of<IsInClub>(context,listen: false);
    final userId = userModel.userId;
    try {
      final response = await http.post(
        Uri.parse("http://vkp18.pythonanywhere.com/createclub"),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'club_name': clubName,
          'admin_id': userId,
        }),
      );

      if (response.statusCode == 201) {
        // Club created successfully
        print('Club created successfully');
        await isIntheClub(context);

      } else {
        // Failed to create club, handle error
        print('Failed to create club: ${response.statusCode}');
        print(response.body);
      }
    } catch (e) {
      // Handle network or other errors
      print('Error creating club: $e');
    }
  }

  Future<void> joinClub(String clubName, BuildContext context) async {
    final userModel = Provider.of<UserModel>(context, listen: false);
    final userId = userModel.userId;
    try {
      final response = await http.post(
        Uri.parse("http://vkp18.pythonanywhere.com/clubs/$clubName/join"),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'user_id': userId,
        }),
      );

      if (response.statusCode == 200) {
        // User joined the club successfully
        print('User joined the club successfully');
      } else {
        // Failed to join the club, handle error
        print('Failed to join the club: ${response.statusCode}');
        print(response.body);
      }
    } catch (e) {
      // Handle network or other errors
      print('Error joining the club: $e');
    }
  }

  Future<void> clubDetails(BuildContext context) async {
  final isInClub = Provider.of<IsInClub>(context, listen: false);
  int clubId = isInClub.clubId!;
  final url = Uri.parse('http://vkp18.pythonanywhere.com/clubs/$clubId');
  
  try {
    final response = await http.get(url);
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      
      if (data != null && data['club_info'] != null) {
        final clubInfo = data['club_info'];
        
        // Parsing admin data
        final adminData = clubInfo['admin'];
        final ClubAdmin clubAdmin = ClubAdmin.fromJson(adminData);
        
        // Parsing currently reading books
        final currentlyReadingBooksData = clubInfo['currently_reading_books'];
        final List<Book> currentlyReadingBooks = (currentlyReadingBooksData != null)
            ? List<Book>.from(currentlyReadingBooksData.map((bookData) => Book.fromJson(bookData)))
            : [];

        // Parsing meetings
        final meetingsData = clubInfo['meetings'];
        final List<Meeting> meetings = (meetingsData != null)
            ? List<Meeting>.from(meetingsData.map((meetingData) => Meeting.fromJson(meetingData)))
            : [];

        // Parsing members
        final membersData = clubInfo['members'];
        final List<Member> members = (membersData != null)
            ? List<Member>.from(membersData.map((memberData) => Member.fromJson(memberData)))
            : [];

        // Parsing recommended books
        final recommendedBooksData = clubInfo['recommended_books'];
        final List<Book> recommendedBooks = (recommendedBooksData != null)
            ? List<Book>.from(recommendedBooksData.map((bookData) => Book.fromJson(bookData)))
            : [];

        // Set club details using Provider
        Provider.of<Club>(context, listen: false).setClub(
          about: clubInfo['about'],
          clubAdmin: clubAdmin,
          clubName: clubInfo['club_name'],
          currentlyReadingBooks: currentlyReadingBooks,
          description: clubInfo['description'],
          location: clubInfo['location'],
          meetings: meetings,
          members: members,
          recommendedBooks: recommendedBooks,
        );
      }
    } else {
      print('Failed to fetch club details: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching club details: $e');
  }
}

}
