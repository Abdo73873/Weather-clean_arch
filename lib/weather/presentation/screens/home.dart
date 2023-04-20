import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osama/weather/data/datasources/remote.dart';
import 'package:osama/weather/data/repository/weather_repostory.dart';
import 'package:osama/weather/presentation/controller/weather_viewmodel.dart';

WeatherViewModel viewModel= WeatherViewModel(WeatherRepository(RemoteDataSource()));

class Home extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  BaseRemoteDataSource baseRemoteDataSource = RemoteDataSource();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = MediaQuery.of(context).size.width;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double appPadding = 20;
    double widthBox = MediaQuery.of(context).size.width / 2-(appPadding+appPadding/2);

    return Scaffold(
      appBar: AppBar(
        title: Text('weather'.tr),
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              decoration:  InputDecoration(
                label: Text("cityName".tr),
              ),
            ),
            TextButton(
                onPressed: () async {
                  viewModel
                      .getWeather(controller.text);
                },
                child: Text('Ok')),
            TextButton(
                onPressed: () async {
                  if(Get.locale==const Locale('ar')) {
                    Get.updateLocale(const Locale('en'));
                  }else{
                    Get.updateLocale(const Locale('ar'));
                  }
                },
                child: const Text('Change Language')),
           Obx(
                 () {
                return Text("${viewModel.counter.value}");
              }
            ),
            TextButton(
                onPressed: () async {
                  viewModel.increment();
                },
                child: Text('Plus')),
            if (viewModel.weather != null)
              Obx(()
                 {
                    return Column(
                      children: [
                        Text("${viewModel.counter.value}"),
                        Text(viewModel.weather!.value.cityName),
                        Text(viewModel.weather!.value.description),
                        Text(viewModel.weather!.value.main),
                        Text('pressure ${viewModel.weather!.value.pressure}'),
                        Text('id ${viewModel.weather!.value.id}'),
                      ],
                    );
                  }
              ),
            Container(
              decoration:  BoxDecoration (
                borderRadius:  BorderRadius.circular(13*fem),
                color:  Color(0xff78fecf),
                boxShadow:  [
                  BoxShadow(
                    color:  Color(0x3f000000),
                    offset:  Offset(-4*fem, 5*fem),
                    blurRadius:  2*fem,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: widthBox,
                  height: 150,
                  child: Container(
                    decoration:  BoxDecoration (
                      borderRadius:  BorderRadius.circular(13*fem),
                      color:  Color(0xfffde686),
                      boxShadow:  [
                        BoxShadow(
                          color:  Color(0xfffde686),
                          offset:  Offset(-4*fem, 5*fem),
                          blurRadius:  2*fem,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: widthBox,
                  height: 150,
                  child: Container(
                    decoration:  BoxDecoration (
                      borderRadius:  BorderRadius.circular(13*fem),
                      color:  Color(0xff78fecf),
                      boxShadow:  [
                        BoxShadow(
                          color:  Color(0x3f000000),
                          offset:  Offset(-4*fem, 5*fem),
                          blurRadius:  2*fem,
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );


  }
}
//1
//2
//3
//4
//5
//6
//7
//8