import 'package:flutter/material.dart';
import 'package:travelling_app/config/API/Place/place_api.dart' as placeApi;

class HotelsView extends StatefulWidget {
  final String placeId;
  const HotelsView({super.key, required this.placeId});

  @override
  State<HotelsView> createState() => _HotelsViewState();
}

class _HotelsViewState extends State<HotelsView> {

  Future<Map<String, dynamic>> fetchPlace() async {
    final temp = await placeApi.Place().getPlaceById(widget.placeId);
    final res = await placeApi.Place().getNearByHotels(temp['data']['location']);
    print(res);
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
          return Scaffold(
            body: Center(
              child: Text('Hotels View'),
            ),
          );
        }
      },
    );
  }
}
