import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelling_app/config/API/Place/place_api.dart';
import 'package:travelling_app/config/colors/colors.dart';

class CityPlaces extends StatefulWidget {
  final String city;
  const CityPlaces({super.key, required this.city});

  @override
  State<CityPlaces> createState() => _CityPlacesState();
}

class _CityPlacesState extends State<CityPlaces> {
  Future<dynamic> fetchData() async {
    final res = await Place().getPlacesByCity(widget.city);
    return res['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .08),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Place in ${widget.city}',
                style: GoogleFonts.rubik(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder<dynamic>(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No data available'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 400,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(snapshot.data?[index]
                                          ['headingImage'] ??
                                      'https://getwallpapers.com/wallpaper/full/2/8/3/129934.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data?[index]['placeName'] ??
                                        'No name',
                                    style: GoogleFonts.rubik(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                          color: AppColors.yellowColor),
                                      SizedBox(width: 10),
                                      Text(
                                        snapshot.data?[index]['rating']
                                                ?.toString() ??
                                            'No rating',
                                        style: GoogleFonts.rubik(
                                          fontSize: 15,
                                          color: AppColors.darkColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                          color: AppColors.yellowColor),
                                      SizedBox(width: 10),
                                      Text(
                                        " City : ${snapshot.data?[index]['city']?.toString()}" ??
                                            'No rating',
                                        style: GoogleFonts.rubik(
                                          fontSize: 15,
                                          color: AppColors.darkColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    snapshot.data?[index]['address'] ??
                                        'No location',
                                    style: GoogleFonts.rubik(
                                      fontSize: 15,
                                      color: AppColors.darkColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
