import 'package:osama/weather/domain/entites/weather.dart';
import 'package:osama/weather/domain/repository/base_weather_repository.dart';

class GetWeatherByCityName{
  final BaseWeatherRepository repository;
  GetWeatherByCityName(this.repository);
  Future<Weather> execute(String cityName)async {
    return await repository.getWeatherByCityName(cityName);
  }
}