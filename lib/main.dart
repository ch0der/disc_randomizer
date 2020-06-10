import 'package:flutter/material.dart';
import 'home_screen.dart';

void main()=> runApp(
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
    return HomeScreen2();
  }
}
