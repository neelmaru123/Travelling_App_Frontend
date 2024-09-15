import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';
import 'package:travelling_app/config/API/Authentication/auth.dart';

class Place {
  final api_url = Auth.api_url;

  Future<dynamic> getPlaces() async {
    final response = await http.get(Uri.parse(api_url + "place"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load places');
    }
  }

  Future<dynamic> getPlaceById(String id) async {
    final response = await http.get(Uri.parse(api_url + "place/" + id));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load place');
    }
  }

  Future<dynamic> getNearByPlaces(String id, Map<String, dynamic> location) async {
    final response = await http.post(Uri.parse(api_url + "place/nearByPlaces/"),
        body: jsonEncode({
          "_id": id,
          "location": location,
        }),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load nearby places');
    }
  }

  Future<dynamic> getNearByHotels(Map<String, dynamic> location) async {
    final response = await http.post(Uri.parse(api_url + "place/findNearByHotels"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(location)
    );
    print(response.body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load places by city');
    }
  }
}
