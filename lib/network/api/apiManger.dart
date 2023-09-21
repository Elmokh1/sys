import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sys/network/api/check_in/check_in_request.dart';
import 'dart:convert';

import 'package:sys/network/api/check_in/check_in_response.dart';
import 'package:sys/network/api/login/login_model.dart';

String baseUrl = "elkady1337-api16.odoo.com";


String db = "elkady1337-api16-main-9531407";

class Api {
  static Future<LoginModel> login(String email, String password) async {
    try {
      var query = {
        'login': email,
        "password": password,
        "db": db,
      };
      final response = await http.get(
        Uri.https(
          baseUrl,
          "/api/login",
          query,
        ),
      );

      if (response.statusCode == 200) {
        var responseBody = response.body;
        var loginModel = LoginModel.fromJson(jsonDecode(responseBody));
        return loginModel;
      } else {
        throw Exception(
            "Failed to load server - Status Code: ${response.statusCode}");
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<CheckInResponse> checkin(String? access_token, String? id) async {
    var uri = Uri.https(baseUrl, "/api/project/create");
    final body = '{"access_token": "$access_token", "id": "$id"}';

    try {
      final headers = {
        'Content-Type': 'application/json',
        'db': db,
      };
      final response = await http.post(
        uri,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final checkInResponse = CheckInResponse.fromJson(jsonDecode(response.body));
        print(response.body);
        return checkInResponse;
      } else {
        throw Exception('Failed to check in - Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw e.toString();
    }
  }


// static Future <dynamic> checkIn(String access_token , String id) async{
//   try {
//     String apiUrl =
//         '$baseUrl/api/project/create';
//     var checkInResponse = await https.post(
//       Uri.parse(apiUrl),
//       headers: headers,
//       body: body,
//     );
//
//     if (checkInResponse.statusCode == 200) {
//       var checkInData = jsonDecode(checkInResponse.body);
//       print('Request successful');
//       print('Response: ${checkInResponse.body}');
//       return checkInData;
//     } else {
//       print('Request failed with status: ${checkInResponse.statusCode}');
//       print('Response: ${checkInResponse.body}');
//     }
//   } catch (e) {
//     throw '$e';
//   }
// }
}

//   https://elkady1337-api16.odoo.com/api/project/create
