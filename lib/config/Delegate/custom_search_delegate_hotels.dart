import 'package:flutter/material.dart';
import 'package:travelling_app/config/API/Place/place_api.dart';
import 'package:travelling_app/config/API/Trips/trip_api.dart';
import 'package:travelling_app/config/routes/routes_name.dart';

class CustomSearchDelegateHotels extends SearchDelegate<String> {
  List<String> searchList = [];
  List<String> idList = [];

  CustomSearchDelegateHotels() {
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final res = await Place().getPlaces();
      searchList = res['data']
          .map<String>((e) => e['placeName'].toString().toLowerCase())
          .toList();
      idList = res['data'].map<String>((e) => e['_id'].toString()).toList();
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          // When pressed here the query will be cleared from the search bar.
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
      // Exit from the search screen.
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<String> searchResults = searchList
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index]),
          onTap: () {
            final index = searchList.indexOf(query);
            Navigator.pushNamed(
              context, RoutesName.hotelsByPlace, arguments: idList[index],
            );
            // Show the search results based on the selected suggestion.
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestionList = query.isEmpty
        ? []
        : searchList
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            query = suggestionList[index];
            showResults(context);
            final index1 = searchList.indexOf(query);
            Navigator.pushNamed(
              context, RoutesName.hotelsByPlace, arguments: idList[index1],
            );
          },
        );
      },
    );
  }
}
