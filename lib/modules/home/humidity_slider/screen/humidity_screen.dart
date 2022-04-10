import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_city/modules/home/humidity_slider/widget/humidity.dart';
import 'package:smart_city/modules/home/humidity_slider/widget/humidity_congfig.dart';
import 'package:smart_city/modules/home/humidity_slider/widget/humidity_info.dart';
import 'package:smart_city/modules/home/humidity_slider/widget/scaffold.dart';
import 'package:smart_city/modules/home/humidity_slider/widget/slider.dart';

class HumidityScreen extends StatelessWidget {
  const HumidityScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => HumidityConfig()),
        ChangeNotifierProvider(create: (_) => Humidity())
      ],
      child: const HumiditySliderScaffold(
        body: HumiditySliderPage(),
      ),
    );
  }
}

class HumiditySliderPage extends StatelessWidget {
  const HumiditySliderPage({Key key}) : super(key: key);

  final bool kShowBack = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          SizedBox(
            width: 180,
            child: HumiditySlider(),
          ),
          Expanded(
            child: HumidityInfo(),
          ),
        ],
      ),
    );
  }
}
