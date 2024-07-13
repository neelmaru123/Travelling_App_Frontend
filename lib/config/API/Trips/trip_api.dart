import 'package:travelling_app/config/API/Authentication/auth.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Trip{
  final api_url = Auth.api_url;

  Future<dynamic> getTripsByPlace(String place) async {
    final response = await http.get(Uri.parse(api_url + "trip?place=$place"));
    print(response.body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load trips');
    }
  }


}