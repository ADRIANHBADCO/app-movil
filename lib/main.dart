import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_veterinaria/src/unauthenticated/home_signup.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'Home',
      routes: <String, WidgetBuilder>{
        'Home': (BuildContext context) => const HomeSignup(),
      },
    );
  }
}
