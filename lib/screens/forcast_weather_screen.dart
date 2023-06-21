import 'package:flutter/material.dart';
import 'package:flutter_assessment2_anwar_tabbaa/API/dio_client.dart';
import 'package:flutter_assessment2_anwar_tabbaa/models/forecast_weather_model.dart';
import 'package:provider/provider.dart';

class WeatherListScreen extends StatefulWidget {
  const WeatherListScreen({Key? key}) : super(key: key);

  @override
  _WeatherListScreenState createState() => _WeatherListScreenState();
}

class _WeatherListScreenState extends State<WeatherListScreen> {
  List<Forecastday> forecastList = [];

  @override
  void initState() {
    super.initState();
    final dioClient = Provider.of<DioClient>(context, listen: false);
    dioClient.getWeatherList().then((list) {
      setState(() {
        forecastList = dioClient.forecastList.forecast?.forecastday ?? [];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
  itemCount: forecastList.length,
  itemBuilder: (context, index) {
    final weather = forecastList[index];
    return InkWell(
      onTap: (){},
      child: ListTile(
        leading: Image.network(
          'http:${weather.day?.condition?.icon}' ?? '',
          width: 50,
          height: 50,
        ),
        title: Text(weather.date ?? ''),
        subtitle: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.sunny),
                Text(weather.astro?.sunrise ?? ''),
              ],
            ),
            const SizedBox(width: 15),
            Row(
              children: [
              const  Icon(Icons.sunny_snowing),
                Text(weather.astro?.sunset ?? ''),
              ],
            ),
          ],
        ),
        trailing: Text('${weather.day?.maxtempC}°C'),
      ),
    );
  },
),

    );
  }
}
