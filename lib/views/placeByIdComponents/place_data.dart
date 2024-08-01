import 'package:flutter/material.dart';
import 'package:travelling_app/config/components/place_by_id.dart';
import 'package:travelling_app/config/API/Place/place_api.dart' as placeApi;

class PlaceData extends StatelessWidget {
  final String placeId;
  const PlaceData({super.key, required this.placeId});

  Future<Map<String, dynamic>> fetchPlace() async {
    print("fetchPlace called"); // Debugging line
    final res = await placeApi.Place().getPlaceById(placeId);
    return res['data'];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: fetchPlace(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data available'));
        } else {
          return PlaceById(isTripVisible: true,placeData: snapshot.data!, isNearbyVisible: true, isPlaceNearByCityVisible: true);
        }
      },
    );
  }
}
