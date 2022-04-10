import 'package:flutter/widgets.dart';

class Humidity with ChangeNotifier {
  Humidity() {
    _transitionalValue = _defaultValue.toDouble();
    _finalValue = _defaultValue;
  }

  final int _defaultValue = 22;

  double _transitionalValue = 0;
  double get transitionalValue => _transitionalValue;

  int _finalValue =9;
  int get finalValue => _finalValue;

  void updateTrasitionalValue(double newValue) {
    _transitionalValue = newValue;
    notifyListeners();
  }

  void updateFinalValue() {
    _finalValue = _transitionalValue.round();
    notifyListeners();
  }
}
