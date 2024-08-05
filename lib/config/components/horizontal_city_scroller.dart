import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelling_app/config/colors/colors.dart';

List PlaceList = [
  {
    "Image" : "https://th.bing.com/th/id/R.c638e1f368cfbb35150bc9a2144b66e7?rik=xnXEJwTmVeEk5Q&riu=http%3a%2f%2fdontgetserious.com%2fwp-content%2fuploads%2f2016%2f07%2fsabarmati-riverfront-at-night.jpg&ehk=b9SBSIXYYmAbT9fT8S2TH7DzLtMn1P4HGYvbAIGOd4I%3d&risl=&pid=ImgRaw&r=0",
    "Name" : "Ahemdabad"
  },
  {
    "Image" : "https://www.holidify.com/images/cmsuploads/compressed/RajkotNight_20191031165253.jpg",
    "Name" : "Rajkot"
  },
  {
    "Image" : "https://eurobuildcee.com/images/97556-large.jpg",
    "Name" : "Surat"
  },
  {
    "Image" : "https://www.gujarattourism.com/content/dam/gujrattourism/images/religious-sites/girnar-hill,-pilgrimage-centre/Girnar-Hill,-Pilgrimage-Centre-Banner.jpg",
    "Name" : "Junagadh"
  },
  {
    "Image" : "https://th.bing.com/th/id/OIP.DrC5EKHoLsimGmnob79uJAHaFj?w=246&h=184&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "Name" : "kutchh"
  },

];

Widget HorizontalCityScroller() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 15, top: 15),
        child: Text(
          "Most visited cities",
          style: GoogleFonts.rubik(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor),
        ),
      ),
      Container(
        height: 280,
        child: PageView.builder(
          itemCount: PlaceList.length,
          controller: PageController(viewportFraction: 0.8),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      image: DecorationImage(
                        image: NetworkImage(PlaceList[index]['Image'] ??
                            "https://th.bing.com/th/id/OIP.YKj7OrGcqWLugJN6YtlGawHaEK?w=293&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
                        fit: BoxFit.cover,
                        onError: (exception, stackTrace) {
                          print('Image Error: $exception');
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Container()), // Add some spacing between the image and the text
                        Text(
                          PlaceList[index]['Name'] ?? 'No name',
                          style: TextStyle(
                              fontSize: 30,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}
