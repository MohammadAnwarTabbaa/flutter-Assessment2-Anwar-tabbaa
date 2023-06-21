import 'package:flutter/material.dart';
import 'package:flutter_assessment2_anwar_tabbaa/screens/forcast_weather_screen.dart';
import 'package:flutter_assessment2_anwar_tabbaa/screens/home_page.dart';

void main() {
  runApp(const TabBarScreen());
}

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: "Daily"),
                Tab(
                  text: "Upcoming 2 week",
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              HomeScreen(),
              WeatherListScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
