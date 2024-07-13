
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelling_app/config/API/Place/place_api.dart';
import 'package:travelling_app/config/components/horizontal_scroller.dart';
import 'package:travelling_app/config/components/horizontal_trips_scroller.dart';

class NearByPlaces extends StatelessWidget {
  final String id;
  final Map<String, dynamic> location;
  const NearByPlaces({super.key, required this.id, required this.location});

  Future<List<dynamic>> fetchPlaces() async {
    final res = await Place().getNearByPlaces(id, location);
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
            title: "Near By Places",
            PlaceList: snapshot.data!,
          );
        }
      },
    );
  }
}
