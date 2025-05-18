import 'package:assessment_app/services/user_service.dart';
import 'package:flutter/material.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  @override
  void initState() {
    // config();
    super.initState();
  }

  void config() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () async {
                await UserService().getAllUsersProfileData();
              },
              child: Text("Click"),
            ),
          ],
        ),
      ),
    );
  }
}
