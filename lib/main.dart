import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:flutter/services.dart';

void main(


    )=> runApp(

  MaterialApp(


    initialRoute: '/',
    routes: {
      '/':(context)=> HomeScreen(),
    },
  ),
);

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return HomeScreen2();
  }
}
