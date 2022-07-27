import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather/view/WeatherView.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

// final testProvider = StateProvider<String>((ref) => "世界线:0.337187");

final weatherProvider = StateProvider<dynamic>((ref) {
  return;
});

final Dio _dio = Dio();

void getWeather() async {
  String url = "/v2.5/8ToODtNzsJ94Ygor/121.6544,25.1552/realtime.json";
  Response response;
  response = await _dio.get(url);
  var data = response.data;
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: double.infinity),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //这里需要填装头部地理位置bar和剩下的可滑动布局
          children: const [
            Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    "章贡区",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 6.0,
                    ),
                  ),
                )),
            Expanded(flex: 9, child: WeatherView())
          ],
        ),
      ),
    );
  }
}
