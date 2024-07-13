import 'package:flutter/material.dart';
import 'package:travelling_app/config/API/Trips/trip_api.dart';
import 'package:travelling_app/config/components/horizontal_scroller.dart';
import 'package:travelling_app/config/components/horizontal_trips_scroller.dart';

class TripsByPlace extends StatelessWidget {
  final String placeId;
  const TripsByPlace({super.key, required this.placeId});

  Future<List<dynamic>> fetchPlaces() async {
    final res = await Trip().getTripsByPlace(placeId);
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
          return HorizontalTripsScroller(
            title: "Trips around this place",
            PlaceList: snapshot.data!,
          );
        }
      },
    );
  }
}
