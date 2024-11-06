import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelling_app/config/API/Authentication/auth.dart';
import 'package:travelling_app/config/API/User/user_api.dart';
import 'package:travelling_app/config/colors/colors.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {

  Future<Map<String, dynamic>> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token') ?? null;

    if (token != null) {
      Map<String, dynamic> payload = parseJwt(token);
      print('Payload: $payload');
      final res = await User().UserById(payload['id']);
      return res['data'];
    }
    else{
      return {};
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(

        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                Text(
                  "Review",
                  style: GoogleFonts.rubik(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkColor),
                ),
                SizedBox(height: 20),
                FutureBuilder(future: getUser(), builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: ProgressIndicatorTheme(data: ProgressIndicatorThemeData(color: AppColors.darkColor), child: CircularProgressIndicator()));
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No data available'));
                  } else {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        border: Border(
                          top: BorderSide(
                            color: AppColors.darkColor,
                            width: 3,
                          ),
                          bottom: BorderSide(
                            color: AppColors.darkColor,
                            width: 3,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        snapshot.data!['profilePhoto'],
                                      ),
                                      fit: BoxFit.cover,
                                      onError: (exception, stackTrace) {
                                        print("Image not found");
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              snapshot.data!['userName'],
                              style: GoogleFonts.rubik(
                                  fontSize: 30,
                                  color: AppColors.darkColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Review 0, Photos 0",
                              style: GoogleFonts.rubik(
                                  fontSize: 20, color: AppColors.darkColor),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                }),

                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: AppColors.darkColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                'Write a review',
                                style: TextStyle(fontSize: 20, color: AppColors.whiteColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // Optional spacing between the two containers
                    Expanded(
                      child: GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: AppColors.darkColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                'Upload a photo',
                                style: TextStyle(fontSize: 19, color: AppColors.whiteColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Is we missing a place?",
                      style: GoogleFonts.rubik(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkColor),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.darkColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          'Add a new place',
                          style: TextStyle(fontSize: 20, color: AppColors.whiteColor),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
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
