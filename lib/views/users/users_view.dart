import 'dart:convert';
import 'package:assessment_app/helpers/colors.dart';
import 'package:assessment_app/helpers/sp_helper.dart';
import 'package:assessment_app/providers/user_provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsersView extends ConsumerStatefulWidget {
  const UsersView({super.key});

  @override
  ConsumerState<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends ConsumerState<UsersView> {
  String? id;

  @override
  void initState() {
    getAuthToken();

    super.initState();
  }

  void getAuthToken() async {
    final token = await SpHelper().getAuthToken();

    // Get userid from token
    if (token == null) {
      return;
    }
    id = extractUserIdFromToken(token);
  }

  String extractUserIdFromToken(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token format');
    }

    final payload = parts[1];

    // Base64 decode with padding fix
    String normalized = base64.normalize(payload);
    final payloadMap = json.decode(utf8.decode(base64Url.decode(normalized)));

    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('Invalid payload structure');
    }

    return payloadMap['id']; // Or 'userId', depending on your backend
  }

  @override
  Widget build(BuildContext context) {
    final users = ref.watch(usersNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text("All Users")),
      body: users.when(
        data: (userData) {
          if (userData.isEmpty) {
            return const Center(child: Text('No users found.'));
          }
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text("Name")),
                DataColumn(label: Text("Email")),
              ],
              rows:
                  userData
                      .map<DataRow>(
                        (user) => DataRow(
                          cells: [
                            user.id == id
                                ? DataCell(
                                  Text(
                                    user.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                )
                                : DataCell(Text(user.name)),
                            DataCell(Text(user.email)),
                          ],
                        ),
                      )
                      .toList(),
            ),
          );
        },
        loading:
            () => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 24),
                  CupertinoActivityIndicator(),
                  SizedBox(height: 16),
                  Text('Fetching users, please wait...'),
                ],
              ),
            ),
        error:
            (err, trace) => const Center(
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Text(
                  'Oops! Something went wrong.\nPlease try again later.',
                  style: TextStyle(fontSize: 16, color: Colors.redAccent),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
      ),
    );
  }
}
