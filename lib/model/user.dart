import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String username = "";
  int? userId ;
  String email = "";
  

  void setUser({required int userId, required String email, required String username}) {
    this.userId = userId;
    this.email = email;
    this.username = username;
    
    notifyListeners();
  }
  Map<dynamic, dynamic> getUser() {
    return {
      'userId': userId,
      'email': email,
      'username': username,
      
    };
  }

}

class IsInClub extends ChangeNotifier{
  bool isInClub = true;
  int? clubId;
  void setIsInClub({required bool isInClub, int? clubId}){
    this.isInClub = isInClub;
    this.clubId = clubId;
    notifyListeners();
  }
  Map<dynamic,dynamic> getIsInClub(){
    return {
      'isInClub': isInClub
    };
  }
}