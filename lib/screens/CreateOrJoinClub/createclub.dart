import 'package:bookclubs/services/apiServices.dart';
import 'package:bookclubs/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CreateClub extends StatefulWidget {
  const CreateClub({super.key});

  @override
  State<CreateClub> createState() => _CreateClubState();
}

class _CreateClubState extends State<CreateClub> {
  final createclub = ApiServices();
  final TextEditingController clubNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create a New Club",
          style: MyText.heading1,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black45,
              margin: const EdgeInsets.symmetric(vertical: 8),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: EdgeInsets.only(top: 2.h, left: 5.w, right: 5.w),
                child: TextField(
                  controller: clubNameController,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    hintText: 'Club name',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 1.5,
                  left: 5.w,
                  right: 5.w),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: clubNameController.text.isEmpty
                        ? Colors.grey
                        : Colors.black),
                onPressed: () {
                  clubNameController.text.isNotEmpty
                      ? createclub.createClub(clubNameController.text, context)
                      : Container();
                },
                child: Text(
                  "Create",
                  style: TextStyle(
                      color: clubNameController.text.isEmpty
                          ? Colors.black
                          : Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
