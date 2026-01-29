import 'dart:convert';
import 'dart:developer' as developer;

import 'package:api_bloc_practice/common/resources/api_endpoints.dart';
import 'package:api_bloc_practice/domain/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<UserModel>> getUserData() async {
    List<UserModel> userModelData = [];
    try {
      final url = Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.users);
      developer.log('Requesting URL: $url');

      final response = await http.get(
        url,
        headers: {
          'User-Agent': 'Mozilla/5.0 (Linux; Android 12) AppleWebKit/537.36',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );

      developer.log('Response status: ${response.statusCode}');
      developer.log('Response headers: ${response.headers}');

      if (response.statusCode == 200) {
        developer.log('Raw data: ${response.body}');
        List<dynamic> userData = jsonDecode(response.body);
        developer.log('Decoded ${userData.length} users');

        for (var data in userData) {
          UserModel userModel = UserModel.fromJson(data);
          userModelData.add(userModel);
        }
        developer.log('Successfully parsed ${userModelData.length} users');
        return userModelData;
      } else {
        developer.log('Error: Status code ${response.statusCode}');
        developer.log('Error body: ${response.body}');
        return [];
      }
    } catch (e) {
      developer.log('Exception: $e');
      rethrow;
    }
  }
}
