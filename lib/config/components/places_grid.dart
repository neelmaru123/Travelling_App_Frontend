import 'package:flutter/material.dart';
import 'package:travelling_app/config/colors/colors.dart';
import 'package:travelling_app/views/Bottom_navigationBar_items/explore_screen.dart';

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

];

Widget PlacesGrid(){
  return Container(
    height: 430,
    padding: const EdgeInsets.all(10),
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.9,
      ),
      physics: NeverScrollableScrollPhysics(),
      itemCount: PlaceList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Stack(
              children: [
                Container(
                  height: 185,
                  width: 185,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    image: DecorationImage(
                      image: NetworkImage(PlaceList[index]['Image'] ??
                          "https://th.bing.com/th/id/OIP.YKj7OrGcqWLugJN6YtlGawHaEK?w=293&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
                      fit: BoxFit.cover,
                      onError: (exception, stackTrace) {
                        print("Image not found");
                      },
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 50, // Adjust the height of the gradient overlay as needed
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(7.0),
                          bottomRight: Radius.circular(7.0),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7), // Adjust opacity as needed
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Container()), // Add some spacing between the image and the text
                      Text(
                        PlaceList[index]['Name'] ?? 'No name',
                        style: TextStyle(
                            fontSize: 22,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    ),
  );
}
