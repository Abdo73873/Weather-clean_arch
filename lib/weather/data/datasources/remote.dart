import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:osama/core/utils/constants.dart';
import 'package:osama/weather/data/models/weather_model.dart';

abstract class BaseRemoteDataSource {
  Future<WeatherModel> getWeatherByCityName(String cityName);
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<WeatherModel> getWeatherByCityName(String cityName) async {
    var response = await Dio().get(
        '${AppConstants.baseUrl}/weather?q=$cityName&appid=${AppConstants.appId}');
    print(response);
    return WeatherModel.fromJson(response.data);
  }
}
