import 'package:osama/weather/data/datasources/remote.dart';
import 'package:osama/weather/domain/entites/weather.dart';
import 'package:osama/weather/domain/repository/base_weather_repository.dart';

class WeatherRepository implements BaseWeatherRepository{
  final  BaseRemoteDataSource baseRemoteDataSource;

  WeatherRepository(this.baseRemoteDataSource);

  @override
  Future<Weather> getWeatherByCityName(String cityName) async {
    return await baseRemoteDataSource.getWeatherByCityName(cityName);
  }

}