import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelling_app/config/colors/colors.dart';
import 'package:travelling_app/config/components/horizontal_city_scroller.dart';
import 'package:travelling_app/config/components/horizontal_scroller.dart';
import 'package:travelling_app/config/components/one_place_view.dart';
import 'package:travelling_app/views/horizontal_scroller_components/top_catagory_places.dart';

List imgList = [
  'https://th.bing.com/th/id/OIP.YfEWxvP3vo59bzzbXkY41AHaE8?w=291&h=194&c=7&r=0&o=5&dpr=1.3&pid=1.7',
  'https://th.bing.com/th/id/OIP.4XK_w4-iVSViNSYvu3QpZAHaE8?w=356&h=194&c=7&r=0&o=5&dpr=1.3&pid=1.7',
  'https://th.bing.com/th/id/OIP.RNCQyNWNTaFBeT0yK7wH_gHaE8?w=291&h=194&c=7&r=0&o=5&dpr=1.3&pid=1.7',
  'https://th.bing.com/th/id/OIP.gXD7vO8xbMkOZirLinWUJwHaDj?w=344&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
  'https://th.bing.com/th/id/OIP.DrC5EKHoLsimGmnob79uJAHaFj?w=246&h=184&c=7&r=0&o=5&dpr=1.3&pid=1.7'
];

List placeList = [
  {
    'img':
        'https://th.bing.com/th/id/OIP.YfEWxvP3vo59bzzbXkY41AHaE8?w=291&h=194&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    'name': 'Name of the place',
    'rating': 'Rating',
    'district': 'District'
  },
  {
    'img':
        '  https://th.bing.com/th/id/OIP.4XK_w4-iVSViNSYvu3QpZAHaE8?w=356&h=194&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    'name': 'Name of the place',
    'rating': 'Rating',
    'district': 'District'
  },
  {
    'img':
        'https://th.bing.com/th/id/OIP.gXD7vO8xbMkOZirLinWUJwHaDj?w=344&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    'name': 'Name of the place',
    'rating': 'Rating',
    'district': 'District'
  },
  {
    'img':
        'https://th.bing.com/th/id/OIP.DrC5EKHoLsimGmnob79uJAHaFj?w=246&h=184&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    'name': 'Name of the place',
    'rating': 'Rating',
    'district': 'District'
  },
];

List GridList = [
  {'name': 'Hotels', 'icon': Icons.hotel},
  {'name': 'Restaurants', 'icon': Icons.local_restaurant_outlined},
  {'name': 'Things to do', 'icon':   Icons.check_circle },
  {'name': 'Advanture', 'icon': Icons.hiking}
];

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.1), // Shadow color with opacity
                    spreadRadius: 5, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: Offset(0, 3), // Offset in the x and y direction
                  ),
                ],
              ),
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item, fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            'No. ${imgList.indexOf(item)} image',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     colors: [
            //       AppColors.DarkGreyColor,
            //       AppColors.whiteColor
            //     ],
            //     stops: [0.5, 1.0],
            //   ),
            // ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0, top: 10),
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: imageSliders,
              ),
            ),
          ),
          TopCatagoryPlaces(),
          OnePlaceView(),
          HorizontalCityScroller(),
          Container(
            height: 160,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColors.yellowColor,
            ),
            child: GridView.builder(
              itemCount: GridList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (MediaQuery.of(context).size.width / 2) / 80,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: AppColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.1), // Shadow color with opacity
                          spreadRadius: 5, // Spread radius
                          blurRadius: 7, // Blur radius
                          offset:
                              Offset(0, 3), // Offset in the x and y direction
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                           Icon(GridList[index]['icon'],
                                  color: AppColors.darkColor),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              GridList[index]['name'],
                              style: GoogleFonts.rubik(
                                color: AppColors.darkColor,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.048,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
