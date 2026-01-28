import 'dart:convert';

import 'package:api_bloc_practice/common/resources/api_endpoints.dart';
import 'package:api_bloc_practice/domain/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<UserModel>> getUserData() async {
    List<UserModel> userModelData = [];
    try {
      http.Request request = http.Request(
        'GET',
        Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.users),
      );
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var rawData = await response.stream.bytesToString();
        List<dynamic> userData = jsonDecode(rawData);
        for (var data in userData) {
          UserModel userModel = UserModel.fromJson(data);
          userModelData.add(userModel);
        }
        return userModelData;
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}
