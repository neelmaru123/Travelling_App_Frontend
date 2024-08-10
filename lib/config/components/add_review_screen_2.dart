import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelling_app/config/colors/colors.dart';
import 'package:travelling_app/config/components/add_review_screen_1.dart';
import 'package:travelling_app/config/routes/routes_name.dart';

class AddReviewScreen2 extends StatefulWidget {
  final Map<String, dynamic> review;
  const AddReviewScreen2({super.key, required this.review});

  @override
  State<AddReviewScreen2> createState() => _AddReviewScreen2State();
}

class _AddReviewScreen2State extends State<AddReviewScreen2> {
  TextEditingController _heading = new TextEditingController();
  TextEditingController _review = new TextEditingController();

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
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
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
                      controller: _heading,
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
                      controller: _heading,
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
                Text(
                  "1/3",
                  style: GoogleFonts.rubik(
                      fontSize: 25, color: AppColors.darkColor),
                ),
                InkWell(
                  onTap: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    String? token = prefs.getString('token') ?? null;
                    Map<String, dynamic> payload = parseJwt(token!);
                    print('Payload: $payload');

                    // Map<String,dynamic> reviews = {
                    //   "rating": _rating,
                    //   "visitDate": _visitDate,
                    //   "typeOfVisit": _visitType,
                    //   "date" : DateTime.now(),
                    //   "placeId" : widget.placeId,
                    //   "userId" : payload['_id'],
                    //   "photos" : "",
                    //   "review" : "",
                    //   "heading" : ""
                    // };
                    Navigator.pushNamed(context, RoutesName.addReviewScreen2);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.darkColor),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
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
    );
  }
}
