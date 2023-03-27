import 'package:osama/weather/domain/entites/weather.dart';

abstract class BaseWeatherRepository{
  Future<Weather> getWeatherByCityName(String cityName);
}