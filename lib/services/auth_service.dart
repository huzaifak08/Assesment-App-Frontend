import 'package:assessment_app/clients/api_client.dart';
import 'package:assessment_app/helpers/endpoints.dart';

class AuthService {
  Future<Map<String, dynamic>> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      String baseUrl = Endpoints.BASE_URL;

      final Map<String, dynamic> body = {
        "name": name,
        "email": email,
        "password": password,
        "profilePic": "NO DP",
      };
      final response = await DioApiClient.postRequest(
        "$baseUrl/auth/register-user",
        data: body,
      );

      print(
        "Status: ${response.data['status']} and message: ${response.data['message']}",
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {
          'status': response.data['status'],
          'message': response.data['message'],
        };
      } else {
        return {
          'status': response.data['status'],
          'message': response.data['message'],
        };
      }
    } catch (e) {
      throw Exception('Failed to register user: $e');
    }
  }

  Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      String baseUrl = Endpoints.BASE_URL;

      final Map<String, dynamic> body = {"email": email, "password": password};
      final response = await DioApiClient.postRequest(
        "$baseUrl/auth/sign-in-user",
        data: body,
      );

      print(
        "Status: ${response.data['status']} and message: ${response.data['message']}",
      );

      if (response.statusCode == 200) {
        return {
          'status': response.data['status'],
          'message': response.data['message'],
        };
      }
      return {'status': false, 'message': "Some unexpected error occurred"};
    } catch (e) {
      throw Exception('Failed to login user: $e');
    }
  }
}
