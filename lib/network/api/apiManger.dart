import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  static Future<dynamic> login(String email, String password) async {
    try {
      String apiUrl =
          'https://elkady1337-api16.odoo.com/api/login?db=elkady1337-api16-main-9531407&login=$email&password=$password';
      var response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // Process the response data as needed
        return data;
      } else {
        throw 'Invalid email or password';
      }
    } catch (e) {
      throw 'Invalid email or password';
    }
  }
}
