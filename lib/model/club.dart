import 'package:bookclubs/model/book.dart';
import 'package:bookclubs/model/clubAdmin.dart';
import 'package:bookclubs/model/meeting.dart';
import 'package:bookclubs/model/member.dart';
import 'package:flutter/material.dart';

class Club extends ChangeNotifier{
  String about = "";
  ClubAdmin? clubAdmin ;
  String clubName = "";
  List<Book>? currentlyReadingBooks;
  String description = "";
  String location = "";
  List<Meeting>? meetings;
  List<Member>? members;
  List<Book>? recommendedBooks;
  void setClub({required String about, required ClubAdmin clubAdmin, required String clubName, required List<Book> currentlyReadingBooks, required String description, required String location, required List<Meeting> meetings, required List<Member> members, required List<Book> recommendedBooks})
  {
    this.about = about;
    this.clubAdmin = clubAdmin;
    this.clubName = clubName;
    this.currentlyReadingBooks = currentlyReadingBooks;
    this.description = description;
    this.location = location;
    this.meetings = meetings;
    this.members = members;
    this.recommendedBooks = recommendedBooks;
    notifyListeners();
  }
}