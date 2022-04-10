import 'package:flutter/material.dart';
import 'package:smart_city/modules/home/temperature_screen.dart';
import 'package:smart_city/shared/components/components.dart';

import 'humidity_slider/screen/humidity_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var tempature = 30;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: (){navigateTo(context, HumidityScreen());}, child: Text('Humidity')),
          ElevatedButton(onPressed: (){navigateTo(context, TemperatureScreen());}, child: Text('Temperature'))
        ],
      ),
    );
  }
}

