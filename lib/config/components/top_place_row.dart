import 'package:flutter/cupertino.dart';
import 'package:travelling_app/config/colors/colors.dart';

List PlaceList = [
  {
    "Image" : "https://th.bing.com/th/id/R.c638e1f368cfbb35150bc9a2144b66e7?rik=xnXEJwTmVeEk5Q&riu=http%3a%2f%2fdontgetserious.com%2fwp-content%2fuploads%2f2016%2f07%2fsabarmati-riverfront-at-night.jpg&ehk=b9SBSIXYYmAbT9fT8S2TH7DzLtMn1P4HGYvbAIGOd4I%3d&risl=&pid=ImgRaw&r=0",
    "Name" : "Ahemdabad",
    "state" : "Gujrat"
  },
  {
    "Image" : "https://eurobuildcee.com/images/97556-large.jpg",
    "Name" : "Surat",
    "state" : "Gujrat"
  },
  {
    "Image" : "https://www.gujarattourism.com/content/dam/gujrattourism/images/religious-sites/girnar-hill,-pilgrimage-centre/Girnar-Hill,-Pilgrimage-Centre-Banner.jpg",
    "Name" : "Junagadh",
    "state" : "Gujrat"
  },

];

Widget TopPlaceRow() {
  return Container(
    height: 170*PlaceList.length.toDouble(),
    child: ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: PlaceList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  image: DecorationImage(
                    image: NetworkImage( PlaceList[index]['Image'] ??
                        "https://th.bing.com/th/id/OIP.YKj7OrGcqWLugJN6YtlGawHaEK?w=293&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
                    fit: BoxFit.cover,
                    onError: (exception, stackTrace) {
                      print("Image not found");
                    },
                  ),
                ),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    PlaceList[index]['Name'] ?? "New York",
                    style: TextStyle(
                        fontSize: 22,
                        color: AppColors.darkColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    PlaceList[index]['state'] ??"USA",
                    style: TextStyle(fontSize: 15, color: AppColors.darkColor),
                  ),
                ],
              )
            ],
          ),
        );
      },
    ),
  );
}
