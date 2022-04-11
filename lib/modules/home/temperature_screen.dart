import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class TemperatureScreen extends StatelessWidget {
  const TemperatureScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context,) {
    double temperature = 7;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature'),
      ),
      body: Column(children: [
        SizedBox(height: 20),
        Text(
          'Today',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w200,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: SleekCircularSlider(
              appearance: CircularSliderAppearance(
                customColors: CustomSliderColors(
                  trackColor: Colors.black12,
                  dotColor: Colors.blueGrey[600],
                  progressBarColor: Colors.blueGrey[300],
                ),
                startAngle: 130.0,
                angleRange: 280.0,
                size: size.height,
                customWidths:
                CustomSliderWidths(progressBarWidth: 5, handlerSize: 10),
              ),
              min: 0,
              max: 100,
              initialValue: temperature,
              onChangeEnd: (_value) => _value,
              innerWidget: (percentage) => Padding(
                padding: const EdgeInsets.all(30.0),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 7,
                          spreadRadius: 8,
                        ),
                      ],
                    ),
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blueGrey,
                          width: 1,
                        ),
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(

                        child: Text(
                          '${percentage.toStringAsFixed(0)}°C',
                          style: TextStyle(
                            fontSize: 15 + (22 * 683 / size.height),
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );

  }
}
