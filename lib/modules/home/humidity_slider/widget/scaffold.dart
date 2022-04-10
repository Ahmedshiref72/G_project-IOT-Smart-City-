import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_city/modules/home/humidity_slider/utils/theme.dart';


class HumiditySliderScaffold extends StatelessWidget {
  const HumiditySliderScaffold({
    Key key,
    @required this.body,
  }) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarBrightness: Brightness.dark),
    );
    return Theme(
      data: humiditySliderTheme,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Humidity'),
        ),
        backgroundColor: humiditySliderTheme.backgroundColor,
        body: body,
        ),
      );
  }

}

