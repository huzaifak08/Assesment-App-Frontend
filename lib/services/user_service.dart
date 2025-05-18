import 'package:assessment_app/clients/api_client.dart';
import 'package:assessment_app/helpers/endpoints.dart';
import 'package:assessment_app/helpers/sp_helper.dart';
import 'package:assessment_app/models/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UserService {
  Future<List<User>> getAllUsersProfileData() async {
    try {
      final baseUrl = Endpoints.BASE_URL;

      final token = await SpHelper().getAuthToken();

      final response = await DioApiClient.getRequest(
        "$baseUrl/user/get-all-users-data",
        options: Options(headers: {"Auth-Token": token}),
      );

      if (response.statusCode == 200) {
        List<dynamic> list = response.data['data'];

        List<User> usersList = list.map((data) => User.fromMap(data)).toList();

        return usersList;
      } else {
        debugPrint("Error Fetching Data");
        return [];
      }
    } catch (err) {
      throw Exception("Exception caught: $err");
    }
  }
}
