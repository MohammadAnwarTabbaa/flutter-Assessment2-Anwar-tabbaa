import 'dart:convert';


import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_assessment2_anwar_tabbaa/models/current_weather_model.dart';

const apiKey = '0f09e3c63079459dba161741232106';
const longLat = '34.02139053920694,35.647088393446026';
const _baseUrl = 'http://api.weatherapi.com/v1';
const _currentWeatherUrl = '$_baseUrl/current.json';
const _forecastUrl = '$_baseUrl/forecast.json';

class DioClient with ChangeNotifier {
  final Dio _dio = Dio();
  final itemCount = 5;
  CurrentWeatherModel currentWeather = CurrentWeatherModel();

  Future<void> getCurrentWeather() async {
    Response response = await _dio.get(_currentWeatherUrl,
        queryParameters: {'key': apiKey, 'q': longLat});
   
    Map<String, dynamic> map = jsonDecode(response.toString());
    currentWeather = CurrentWeatherModel.fromJson(map);
    notifyListeners();
  }

  Future<void> getForecast(String category) async {
    Response response = await _dio.get(_forecastUrl);

    if (kDebugMode) {
      // print('List Info: $response');
    }
  }
}