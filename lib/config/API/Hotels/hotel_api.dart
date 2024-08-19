import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travelling_app/config/API/Authentication/auth.dart';

class Hotels{
  final api_url = Auth.api_url;

  Future<dynamic> getHotels() async {
    final response = await http.get(Uri.parse(api_url + "hotel"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load hotels');
    }
  }

}
