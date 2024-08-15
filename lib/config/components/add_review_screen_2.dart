import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelling_app/config/colors/colors.dart';
import 'package:travelling_app/config/components/add_review_screen_1.dart';
import 'package:travelling_app/config/routes/routes_name.dart';

import '../API/Reviews/review_api.dart';

class AddReviewScreen2 extends StatefulWidget {
  final Map<String, dynamic> review;
  const AddReviewScreen2({super.key, required this.review});

  @override
  State<AddReviewScreen2> createState() => _AddReviewScreen2State();
}

class _AddReviewScreen2State extends State<AddReviewScreen2> {
  String _heading = "";
  String _review = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.darkColor,
        foregroundColor: AppColors.whiteColor,
        leading: IconButton(
          icon: Icon(CupertinoIcons.clear, size: 30),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Cancel Review"),
                  content: Text("Are you sure you want to cancel the review?"),
                  actions: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.darkColor
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text("No", style: GoogleFonts.rubik(color: AppColors.whiteColor),),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: AppColors.darkColor
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();// Navigate back to the previous page
                      },
                      child: Text("Yes", style: GoogleFonts.rubik(color: AppColors.whiteColor),),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            SizedBox(height: 10,),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                  color: AppColors.darkColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Write a heading of the review",
                          style: GoogleFonts.rubik(
                              fontSize: 18, color: AppColors.whiteColor)),
                      SizedBox(height: 10),
                      TextFormField(
                        onChanged: (value) {
                          _heading = value;
                        },
                        style: GoogleFonts.rubik(
                          fontSize: 18,
                          color: Colors.white70,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("When did you visit?",
                          style: GoogleFonts.rubik(
                              fontSize: 18, color: AppColors.whiteColor)),
                      SizedBox(height: 10),
                      TextFormField(
                        onChanged: (value) {
                          _review = value;
                        },
                        style: GoogleFonts.rubik(
                          fontSize: 18,
                          color: Colors.white70,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        maxLines:
                            null, // Allows the text field to expand vertically
                        keyboardType:
                            TextInputType.multiline, // Enables multiline input
                      ),
                      SizedBox(height: 70),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.05,
                  left: MediaQuery.of(context).size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.darkColor),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.swipe_left_sharp,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Back",
                              style: GoogleFonts.rubik(
                                  fontSize: 18, color: AppColors.whiteColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "2/2",
                    style: GoogleFonts.rubik(
                        fontSize: 25, color: AppColors.darkColor),
                  ),
                  InkWell(
                    onTap: () async {
                      widget.review["heading"] = _heading;
                      widget.review["review"] = _review;

                      Map<String, dynamic> res = (await Review().add_review(widget.review)) as Map<String, dynamic>;

                      if (res['success']) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Review Added"),
                              content: Text("Your review has been added successfully."),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Close the dialog
                                    Navigator.pushReplacementNamed(
                                      context,
                                      RoutesName.placeDataScreen,
                                      arguments: widget.review["placeId"],
                                    ); // Navigate to PlaceByIdScreen and replace the current screen
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        print("Failed to add review");
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.darkColor),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Next",
                          style: GoogleFonts.rubik(
                              fontSize: 18, color: AppColors.whiteColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
