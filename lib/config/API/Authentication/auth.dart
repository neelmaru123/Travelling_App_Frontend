import 'package:http/http.dart' as http;
import 'dart:convert';



class Auth {
  static const api_url = "https://travelling-app-backend.onrender.com/";
  // static const api_url = "http://localhost:3500/";

  Future<dynamic> login(String email, String password) async {
    try {
      http.Response response = await http.post(
        Uri.parse(api_url + "auth/userLogin"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
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
