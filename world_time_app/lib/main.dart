import 'package:flutter/material.dart';
import 'package:world_time_app/pages/choose_location.dart';
import 'package:world_time_app/pages/home.dart';
import 'pages/home.dart';
import 'package:world_time_app/pages/loading.dart';
// import 'package:world_time_app/pages/choose_location.dart';
import 'package:http/http.dart';
void main() {
  runApp(MaterialApp(
    // home:Home(),
    initialRoute: '/',
    routes: {
      '/':(context) => Loading(),
      '/home':(context) => Home(),
      '/location' :(context) => ChooseLocation(),
    },
  ));
}
