import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Welcome to the Home View!'),
            ElevatedButton(
              onPressed: () {
                // Add your button action here
              },
              child: const Text('Click Me'),
            ),
          ],
        ),
      ),
    );
  }
}
