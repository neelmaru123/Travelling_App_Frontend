import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travelling_app/config/API/Authentication/auth.dart';

class Review {
  final api_url = Auth.api_url;

  Future<dynamic> getReviewsByPlaceId(String PlaceId) async {
    final response = await http.get(Uri.parse(api_url + "review/" + PlaceId));
    print(response.body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load reviews');
    }
  }
}

