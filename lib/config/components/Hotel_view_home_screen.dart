import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ],
      ),
    );
  }
}
