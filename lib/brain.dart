import 'dart:math';

class Brain {
  final int weight;
  final int height;
  double _bmi = 0;

  Brain({required this.height, required this.weight});

  String calculate() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    print(_bmi);
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getDesc() {
    if (_bmi >= 25) {
      return "You have a higher than normal body weight!";
    } else if (_bmi > 18.5) {
      return "You have a normal body weight!";
    } else {
      return "You have a lower than normal body weight!";
    }
  }
}
