import 'package:assessment_app/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
Future<Map<String, dynamic>> registerUserNotifier(
  Ref ref,
  String fullName,
  String email,
  String password,
) async {
  final Map<String, dynamic> userStatus = await AuthService().registerUser(
    name: fullName,
    email: email,
    password: password,
  );

  return userStatus;
}

@riverpod
Future<Map<String, dynamic>> loginUserNotifier(
  Ref ref,
  String email,
  String password,
) async {
  final Map<String, dynamic> userStatus = await AuthService().loginUser(
    email: email,
    password: password,
  );

  return userStatus;
}
