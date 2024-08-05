import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelling_app/config/colors/colors.dart';

Widget HorizontalTripsScroller(
    {required String title, required List PlaceList}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 15, top: 15),
        child: Text(
          title,
          style: GoogleFonts.rubik(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor),
        ),
      ),
      Container(
          height: 310,
          child: ListView.builder(
              itemCount: PlaceList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, RoutesName.placeDataScreen,
                    //     arguments: PlaceList[index]['_id']);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                7.0), // Adjust the value to your preference
                            image: DecorationImage(
                              image: NetworkImage(PlaceList[index]['Image'] ??
                                  "https://th.bing.com/th/id/OIP.YKj7OrGcqWLugJN6YtlGawHaEK?w=293&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                            height:
                                10), // Add some spacing between the image and the text
                        Container(
                          width: 200,
                          child: Text(
                            PlaceList[index]['tripName'] ?? 'No name',
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.DarkGreyColor,
                            ),
                            softWrap: true,
                          ),
                        ),
                        Text(
                          PlaceList[index]['tripType']?.toString() ?? 'Nn type',
                          style: TextStyle(
                              fontSize: 15, color: AppColors.DarkGreyColor),
                        ),
                      ],
                    ),
                  ),
                );
              }))
    ],
  );
}
