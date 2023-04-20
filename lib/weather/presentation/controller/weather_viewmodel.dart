import 'package:get/get.dart';
import 'package:osama/weather/domain/entites/weather.dart';


import '../../domain/repository/base_weather_repository.dart';
import '../../domain/usecases/get_weather_by_country.dart';

class WeatherViewModel extends GetxController {
  BaseWeatherRepository baseWeatherRepository;
  WeatherViewModel(this.baseWeatherRepository);
 var  counter = 0.obs;

  void increment() {
    counter++;
  }

  var weather=(Weather(0, '', '', '', 0)).obs;
  void getWeather(String city) async {
     weather=(await GetWeatherByCityName(baseWeatherRepository).execute(city)).obs;
  }
}
