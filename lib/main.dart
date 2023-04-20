import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osama/core/language/translate.dart';
import 'package:osama/weather/data/datasources/remote.dart';
import 'package:osama/weather/data/repository/weather_repostory.dart';
import 'package:osama/weather/domain/entites/weather.dart';
import 'package:osama/weather/domain/repository/base_weather_repository.dart';
import 'package:osama/weather/domain/usecases/get_weather_by_country.dart';
import 'package:osama/weather/presentation/screens/home.dart';

void main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: Translation(),
      locale: const Locale("en"),
      fallbackLocale: const Locale("en"),
      home:  Home(),
    );
  }
}


