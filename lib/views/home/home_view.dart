import 'package:assessment_app/helpers/colors.dart';
import 'package:assessment_app/views/gemini/ai_view.dart';

import 'package:assessment_app/views/quotes/quotes_view.dart';
import 'package:assessment_app/views/users/users_view.dart';
import 'package:assessment_app/views/weather/weather_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    QuotesView(),
    AiView(),
    WeatherView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              "https://media.licdn.com/dms/image/v2/D4E0BAQE27zp49nV7Ew/company-logo_100_100/company-logo_100_100/0/1725086602759/360mimar_logo?e=2147483647&v=beta&t=bebjL5JtwtfR20EJj01vGJzGDVQ8arr3q6kR3At_JsU",
            ),
          ),
        ),
        title: Text(
          'MIM Studio',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.secondaryColor,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        actions: [
          OutlinedButton(
            onPressed: () {},
            child: Text('Log out', style: TextStyle(fontSize: 14)),
            style: OutlinedButton.styleFrom(
              // minimumSize: Size(80, 36), // Adjust width and height as needed
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              foregroundColor: AppColors.secondaryColor,
              side: BorderSide(color: AppColors.whiteColor),
              // textStyle: TextStyle(fontSize: 14),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UsersView()),
              );
            },
            icon: Icon(
              Icons.account_circle_outlined,
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.format_quote),
            label: 'Quotes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.adjust_outlined),
            label: 'AI',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_outlined),
            label: 'Weather',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        onTap: _onItemTapped,
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
    );
  }
}
