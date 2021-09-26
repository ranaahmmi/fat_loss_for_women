import 'dart:math';

class CalculatorBMI {
  final double height;
  final double weight;
  late double _bmi;
  CalculatorBMI({
    this.height = 0,
    this.weight = 0,
  });

  String getBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 30)
      return 'Obesity';
    else if (_bmi > 25)
      return 'Overweight';
    else if (_bmi > 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getInterpretation() {
    if (_bmi > 30)
      return 'Ohh No! You have much more weight than that of a normal person.';
    else if (_bmi > 25)
      return 'Ahh! Your body weight is more than normal. Try to exercise more and maintain a healthy diet.';
    else if (_bmi > 18.5)
      return 'WOW! You have a perfect weight. Let\'s maintain this.';
    else
      return 'Ohh! Your body weight is less than normal. Try to eat more and live a healthy life.';
  }
}
