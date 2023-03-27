import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:osama/weather/data/datasources/remote.dart';
import 'package:osama/weather/data/repository/weather_repostory.dart';
import 'package:osama/weather/domain/entites/weather.dart';
import 'package:osama/weather/domain/repository/base_weather_repository.dart';
import 'package:osama/weather/domain/usecases/get_weather_by_country.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller=TextEditingController();
  BaseRemoteDataSource baseRemoteDataSource=RemoteDataSource();
   late BaseWeatherRepository baseWeatherRepository;

   Weather? weather;
  @override
  Widget build(BuildContext context) {
    baseWeatherRepository=WeatherRepository(baseRemoteDataSource);
    return  Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                label: Text("City Name"),
              ),

            ),
            TextButton(
                onPressed: () async {
                  weather =await GetWeatherByCityName(baseWeatherRepository).execute(controller.text);
                  setState(() {});
                },
                child: Text('Ok')),
           if(weather!=null)
           Column(
             children: [
               Text(weather!.cityName),
               Text(weather!.description),
               Text(weather!.main),
               Text('pressure ${weather!.pressure}'),
               Text('id ${weather!.id}'),
             ],
           ),
          ],
        ),
      ),
    );
  }
}
