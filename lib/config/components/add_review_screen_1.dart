import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelling_app/config/API/Reviews/review_api.dart';
import 'package:travelling_app/config/colors/colors.dart';
import 'package:travelling_app/config/routes/routes_name.dart';

class AddReviewScreen1 extends StatefulWidget {
  final String placeId;
  const AddReviewScreen1({super.key, required String this.placeId});

  @override
  State<AddReviewScreen1> createState() => _AddReviewScreen1State();
}

class _AddReviewScreen1State extends State<AddReviewScreen1> {
  int _rating = 0;
  String _visitType = '';
  DateTime _visitDate = DateTime.now();

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
                    Text("How would you rate your experience?",
                        style: GoogleFonts.rubik(
                            fontSize: 18, color: AppColors.whiteColor)),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          IconData iconData;
                          switch (index) {
                            case 0:
                              iconData = Icons.sentiment_very_dissatisfied;
                              break;
                            case 1:
                              iconData = Icons.sentiment_dissatisfied;
                              break;
                            case 2:
                              iconData = Icons.sentiment_neutral;
                              break;
                            case 3:
                              iconData = Icons.sentiment_satisfied;
                              break;
                            case 4:
                              iconData = Icons.sentiment_very_satisfied;
                              break;
                            default:
                              iconData = Icons.sentiment_neutral;
                          }
                          return IconButton(
                            icon: Icon(
                              iconData,
                              color: _rating >= index + 1
                                  ? AppColors.yellowColor
                                  : AppColors.whiteColor,
                              size: 30,
                            ),
                            onPressed: () {
                              setState(() {
                                _rating = index + 1;
                              });
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("When did you visit?",
                        style: GoogleFonts.rubik(
                            fontSize: 18, color: AppColors.whiteColor)),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () async {
                        final DateTime? picked = await showDatePicker(
                          currentDate: DateTime.now(),
                          context: context,
                          initialDate: _visitDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null && picked != _visitDate) {
                          setState(() {
                            _visitDate = picked;
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Select date: ${DateFormat('dd-MM-yyyy').format(_visitDate)}",
                          style: GoogleFonts.rubik(
                              fontSize: 18, color: AppColors.darkColor),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text("What type of visit was it?",
                        style: GoogleFonts.rubik(
                            fontSize: 18, color: AppColors.whiteColor)),
                    SizedBox(height: 15),
                    Wrap(
                      spacing: 10.0,
                      runSpacing: 10,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _visitType = 'Solo';
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: _visitType == 'Solo'
                                    ? AppColors.yellowColor
                                    : AppColors.whiteColor,
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text(
                                "Solo",
                                style: GoogleFonts.rubik(
                                  fontSize: 18,
                                  color: _visitType == 'Solo'
                                      ? AppColors.yellowColor
                                      : AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _visitType = 'Business';
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: _visitType == 'Business'
                                    ? AppColors.yellowColor
                                    : AppColors.whiteColor,
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text(
                                "Business",
                                style: GoogleFonts.rubik(
                                  fontSize: 18,
                                  color: _visitType == 'Business'
                                      ? AppColors.yellowColor
                                      : AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _visitType = 'Couples';
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: _visitType == 'Couples'
                                    ? AppColors.yellowColor
                                    : AppColors.whiteColor,
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text(
                                "Couples",
                                style: GoogleFonts.rubik(
                                  fontSize: 18,
                                  color: _visitType == 'Couples'
                                      ? AppColors.yellowColor
                                      : AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _visitType = 'Family (teens)';
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: _visitType == 'Family (teens)'
                                    ? AppColors.yellowColor
                                    : AppColors.whiteColor,
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text(
                                "Family (teens)",
                                style: GoogleFonts.rubik(
                                  fontSize: 18,
                                  color: _visitType == 'Family (teens)'
                                      ? AppColors.yellowColor
                                      : AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _visitType = 'Family';
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: _visitType == 'Family'
                                    ? AppColors.yellowColor
                                    : AppColors.whiteColor,
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text(
                                "Family",
                                style: GoogleFonts.rubik(
                                  fontSize: 18,
                                  color: _visitType == 'Family'
                                      ? AppColors.yellowColor
                                      : AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _visitType = 'Friends';
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: _visitType == 'Friends'
                                    ? AppColors.yellowColor
                                    : AppColors.whiteColor,
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text(
                                "Friends",
                                style: GoogleFonts.rubik(
                                  fontSize: 18,
                                  color: _visitType == 'Friends'
                                      ? AppColors.yellowColor
                                      : AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 70),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05, left: MediaQuery.of(context).size.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "1/2",
                  style: GoogleFonts.rubik(
                      fontSize: 25, color: AppColors.darkColor),
                ),
                InkWell(
                  onTap:  () async{
                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                    String? token = prefs.getString('token') ?? null;
                    Map<String, dynamic> payload = parseJwt(token!);
                    print('Payload: $payload');

                    String reviewDateString = _visitDate.toIso8601String();
                    String todatDate = DateTime.now().toIso8601String();
                    print(reviewDateString);
                    Map<String,dynamic> reviews = {
                      "rating": _rating as int,
                      "visitDate": reviewDateString,
                      "typeOfVisit": _visitType as String,
                      "date" : todatDate,
                      "placeId" : widget.placeId as String,
                      "userId" : payload['_id'],
                      "review" : "",
                      "heading" : ""
                    };
                    Navigator.pushNamed(context, RoutesName.addReviewScreen2, arguments: reviews);

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.darkColor
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Next",
                        style: GoogleFonts.rubik(
                          fontSize: 18,
                          color: AppColors.whiteColor
                        ),
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

Map<String, dynamic> parseJwt(String token) {
  final parts = token.split('.');
  if (parts.length != 3) {
    throw Exception('Invalid token');
  }

  final payload = parts[1];
  var normalized = base64Url.normalize(payload);
  var resp = utf8.decode(base64Url.decode(normalized));

  final payloadMap = json.decode(resp);
  if (payloadMap is! Map<String, dynamic>) {
    throw Exception('Invalid payload');
  }

  return payloadMap;
}
