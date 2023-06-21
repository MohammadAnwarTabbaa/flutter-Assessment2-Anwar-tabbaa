import 'package:flutter/material.dart';
import 'package:flutter_assessment2_anwar_tabbaa/API/dio_client.dart';
import 'package:flutter_assessment2_anwar_tabbaa/widgets/build_info_row.dart';
import 'package:provider/provider.dart';

const _baseUrl = 'http://api.weatherapi.com/v1';

enum TemperatureUnit {
  celsius,
  fahrenheit,
}

const String defaultImage =
    'https://cdn.dribbble.com/users/162970/screenshots/6456084/casual-bounce.gif';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  // static Route route() {
  //   return MaterialPageRoute(
  //       builder: (_) => const ForecastScreen(),
  //       settings: const RouteSettings(name: RouteNames.forecastScreen));
  // }

  @override
  State<HomeScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<HomeScreen> {
  TemperatureUnit _selectedUnit = TemperatureUnit.celsius;
  var pageIndex = 1;

  @override
  Widget build(BuildContext context) {
    var weatherProvider = Provider.of<DioClient>(context);
    if (weatherProvider.currentWeather.location == null) {
      weatherProvider.getCurrentWeather();
    }
    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      // if (scrollController.position.maxScrollExtent ==
      //     scrollController.position.pixels) {
      //   weatherProvider.getCategoriesList();
      // }
    });
    return Scaffold(
      appBar: AppBar(title: Text('Current weather')),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: weatherProvider.currentWeather.current == null
              ? [
                  const SizedBox(height: 100),
                  const Text('Getting Weather...'),
                ]
              : [
                  Image.network(
                      'http:${weatherProvider.currentWeather.current?.condition?.icon}' ??
                          defaultImage,
                      width: 150,
                      height: 100),
                  const SizedBox(height: 20),
                  const Text('Daily'),
                  const SizedBox(height: 20),
                  // Text(weatherProvider.currentWeather.current.tempC),
                  Text(
                    _selectedUnit == TemperatureUnit.celsius
                        ? '${weatherProvider.currentWeather.current?.tempC ?? ''}°C'
                        : '${weatherProvider.currentWeather.current?.tempF ?? ''}°F',
                    style: TextStyle(fontSize: 40),
                  ),
                  DropdownButton<TemperatureUnit>(
                    value: _selectedUnit,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedUnit = newValue!;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: TemperatureUnit.celsius,
                        child: Text('C'),
                      ),
                      DropdownMenuItem(
                        value: TemperatureUnit.fahrenheit,
                        child: Text('F'),
                      ),
                    ],
                  ),
                 const  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text(weatherProvider.currentWeather.current.windMph),
                      Text(
                        "Humidity:${weatherProvider.currentWeather.current?.humidity!}%rh ",
                      ),
                      Text(
                        "Cloud:${weatherProvider.currentWeather.current?.cloud!}% ",
                      ),
                      Text(
                        "Humidity:${weatherProvider.currentWeather.current?.windMph!} mph",
                      ),
                    ],
                  ),
                  const  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Text("Location:"),
                        InfoRow(
                            label: 'Name',
                            value:
                                weatherProvider.currentWeather.location?.name ??
                                    ''),
                        InfoRow(
                            label: 'Region',
                            value: weatherProvider
                                    .currentWeather.location?.region ??
                                ''),
                        InfoRow(
                            label: 'Country',
                            value: weatherProvider
                                    .currentWeather.location?.country ??
                                ''),
                        InfoRow(
                            label: 'Timezone',
                            value:
                                weatherProvider.currentWeather.location?.tzId ??
                                    ''),
                        InfoRow(
                            label: 'Last Updated',
                            value: weatherProvider
                                    .currentWeather.current?.lastUpdated ??
                                ''),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                ],
        ),
      ),
    );
  }
}
