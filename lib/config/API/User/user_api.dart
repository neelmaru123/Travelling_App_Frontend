
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:travelling_app/config/API/Authentication/auth.dart';

class User{
  static const api_url = Auth.api_url;

  Future<dynamic> register(String email, String password, String name) async {
    try {
      http.Response response = await http.post(
        Uri.parse(api_url + "user"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
          'userName': name,
        }),
      );
      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw e;
    }
  }

}