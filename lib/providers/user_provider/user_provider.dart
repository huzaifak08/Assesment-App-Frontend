import 'package:assessment_app/models/user.dart';
import 'package:assessment_app/services/user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
Future<List<User>> usersNotifier(Ref ref) async {
  List<User> users = await UserService().getAllUsersProfileData();

  return users;
}
