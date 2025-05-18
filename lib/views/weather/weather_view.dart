import 'package:assessment_app/helpers/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);

  final List<String> _cities = [
    'Islamabad',
    'Lahore',
    'Karachi',
    'Peshawar',
    'Quetta',
  ];
  String _selectedCity = 'Islamabad';

  Weather? _weather;

  @override
  void initState() {
    super.initState();
    _fetchWeather(_selectedCity);
  }

  void _fetchWeather(String city) {
    _wf.currentWeatherByCityName(city).then((w) {
      setState(() {
        _weather = w;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildUI());
  }

  Widget _buildUI() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _cityDropdown(),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
          if (_weather == null)
            const Center(child: CupertinoActivityIndicator(radius: 15))
          else ...[
            _dateTimeInfo(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            _weatherIcon(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
            _currentTemp(),
          ],
        ],
      ),
    );
  }

  Widget _cityDropdown() {
    return DropdownButton<String>(
      value: _selectedCity,
      items:
          _cities
              .map((city) => DropdownMenuItem(value: city, child: Text(city)))
              .toList(),
      onChanged: (value) {
        if (value != null && value != _selectedCity) {
          setState(() {
            _selectedCity = value;
            _weather = null;
          });
          _fetchWeather(value);
        }
      },
    );
  }

  Widget _dateTimeInfo() {
    DateTime now = _weather!.date!;
    return Column(
      children: [
        Text(DateFormat("h:mm a").format(now), style: TextStyle(fontSize: 35)),
        SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              DateFormat("EEEE").format(now),
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Text(
              " ${DateFormat("d.m.y").format(now)}",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ],
    );
  }

  Widget _weatherIcon() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.20,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "http://openweathermap.org/img/wn/${_weather?.weatherIcon}@4x.png",
              ),
            ),
          ),
        ),
        Text(
          _weather?.weatherDescription ?? '',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  Widget _currentTemp() {
    return Text(
      "${_weather?.temperature?.celsius?.toStringAsFixed(0)}° C",
      style: TextStyle(fontSize: 90, fontWeight: FontWeight.w500),
    );
  }
}
