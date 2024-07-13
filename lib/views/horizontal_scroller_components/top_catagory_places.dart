import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelling_app/config/API/Place/place_api.dart';
import 'package:travelling_app/config/components/horizontal_scroller.dart';



class TopCatagoryPlaces extends StatelessWidget {

  Future<List<dynamic>> fetchPlaces() async {
    print("fetchPlaces called"); // Debugging line
    final res = await Place().getPlaces();
    print(res['data']);
    return res['data'];
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: fetchPlaces(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data available'));
        } else {
          return HorizontalScroller(
            title: "Top Religious places",
            PlaceList: snapshot.data!,
          );
        }
      },
    );
  }
}