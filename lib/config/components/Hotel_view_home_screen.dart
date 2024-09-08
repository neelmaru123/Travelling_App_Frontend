import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelling_app/config/API/Hotels/hotel_api.dart';
import 'package:travelling_app/config/Delegate/custom_search_delegate_hotels.dart';
import 'package:travelling_app/config/colors/colors.dart';

class HotelViewHomeScreen extends StatefulWidget {
  const HotelViewHomeScreen({super.key});

  @override
  State<HotelViewHomeScreen> createState() => _HotelViewHomeScreenState();

}



class _HotelViewHomeScreenState extends State<HotelViewHomeScreen> {

  final TextEditingController _controller = TextEditingController();
  final CustomSearchDelegateHotels _searchDelegate = CustomSearchDelegateHotels();
  List<String> _searchResults = [];

  void _updateSearchResults(String query) {
    setState(() {
      _searchResults = _searchDelegate.searchList
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Future<dynamic> fetchData() async {
    final res = await Hotels().getHotels();
    return res['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .04),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: _controller,
              onTap: () {
                showSearch(
                  context: context,
                  delegate: _searchDelegate,
                );
              },
              decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: AppColors.darkColor, width: 3.0),
                ),
                hintText: "Search for perticular place",
                prefixIcon: Icon(Icons.search, color: AppColors.darkColor, size: 30),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: AppColors.darkColor, width: 3.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.darkColor, width: 3.0),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Popular Hotels',
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
                      print(snapshot.data?[index]['headingImage']);
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
                                  image: NetworkImage(snapshot.data?[index]['headingImage'] ?? 'https://getwallpapers.com/wallpaper/full/2/8/3/129934.jpg'),
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
                                    snapshot.data?[index]['hotelName'] ?? 'No name',
                                    style: GoogleFonts.rubik(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: AppColors.yellowColor),
                                      SizedBox(width: 10),
                                      Text(
                                        snapshot.data?[index]['rating']?.toString() ?? 'No rating',
                                        style: GoogleFonts.rubik(
                                          fontSize: 15,
                                          color: AppColors.darkColor,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Text(
                                    snapshot.data?[index]['address'] ?? 'No location',
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
