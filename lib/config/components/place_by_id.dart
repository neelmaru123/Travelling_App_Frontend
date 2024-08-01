import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:travelling_app/config/colors/colors.dart';
import 'package:travelling_app/config/components/horizontal_city_scroller.dart';
import 'package:travelling_app/config/routes/routes_name.dart';
import 'package:travelling_app/views/Bottom_navigationBar_items/explore_screen.dart';
import 'package:travelling_app/views/horizontal_scroller_components/near_by_places.dart';
import 'package:travelling_app/views/horizontal_scroller_components/top_catagory_places.dart';
import 'package:travelling_app/views/horizontal_scroller_components/trips_by_place.dart';
import 'package:travelling_app/views/placeByIdComponents/reviews_by_placeId.dart';
import 'package:url_launcher/url_launcher.dart';

Map<String, dynamic> Place = {
  'img': 'https://th.bing.com/th/id/OIP.YfEWxvP3vo59bzzbXkY41AHaE8?w=291&h=194&c=7&r=0&o=5&dpr=1.3&pid=1.7',
  'name': 'Name of the place',
  'rating': 'Rating',
  'district': 'District',
  'description': 'Description',
};

class PlaceById extends StatefulWidget {
  bool? isTripVisible;
  bool? isNearbyVisible;
  bool? isPlaceNearByCityVisible;
  final Map<String, dynamic> placeData;
  PlaceById({
    Key? key,
    required this.placeData,
    this.isTripVisible = false,
    this.isNearbyVisible = false,
    this.isPlaceNearByCityVisible = false
  }) : super(key: key);


  @override
  State<PlaceById> createState() => _PlaceByIdState();
}

class _PlaceByIdState extends State<PlaceById> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushNamed(context, RoutesName.homeScreen);
        break;
      case 1:
        Navigator.pushNamed(context, RoutesName.homeScreen);
        break;
      case 2:
        Navigator.pushNamed(context, RoutesName.homeScreen);
        break;
      case 3:
        Navigator.pushNamed(context, RoutesName.homeScreen);
        break;
    }
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkColor,
        foregroundColor: AppColors.whiteColor,
        leading: IconButton(
          icon: Icon(CupertinoIcons.left_chevron, size: 30),
          onPressed: () {
           Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share, size: 30),
            onPressed: () {
              // Handle the button's onPressed event here
            },
          ),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 230,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.placeData["headingImage"] ??
                      "https://th.bing.com/th/id/OIP.YKj7OrGcqWLugJN6YtlGawHaEK?w=293&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.placeData["placeName"] ?? "No name",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star, color: AppColors.yellowColor),
                      SizedBox(width: 10),
                      Text(
                        widget.placeData["rating"]?.toString() ?? "No rating",
                        style: TextStyle(
                            fontSize: 20, color: AppColors.mutedBlueColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'City : ' + widget.placeData["city"] ?? "No district",
                    style: TextStyle(
                        fontSize: 20, color: AppColors.mutedBlueColor),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.placeData["description"] ?? "No description",
                    style: TextStyle(
                        fontSize: 20, color: AppColors.mutedBlueColor),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.yellowColor)),
                    onPressed: () => _launchURL(widget.placeData["locationUrl"] ?? "https://www.google.com"),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: Text(
                        "View on map",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: AppColors.darkGreenColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  widget.isTripVisible == true ? TripsByPlace(placeId : widget.placeData['_id']) : Container(),
                  widget.isNearbyVisible == true ? NearByPlaces(id: widget.placeData['_id'], location: widget.placeData['location']) : Container(),
                  Text(
                    "Contribute",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkColor),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("Write a review");
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: AppColors.softGreenColor, width: 3.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                              child: Text('Write a review', style: TextStyle(fontSize: 20, color: AppColors.darkColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          print("Upload a photo");
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: AppColors.softGreenColor, width: 3.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                              child: Text('Upload a photo', style: TextStyle(fontSize: 19, color: AppColors.darkColor),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  ReviewsByPlaceId(placeId: widget.placeData['_id']),
                ],

              ),
            )
          ],
        ),
      )),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.mutedBlueColor,
        currentIndex: 0,
        selectedItemColor: AppColors.darkColor,
        unselectedItemColor: AppColors.mutedBlueColor,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: 'Review',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
