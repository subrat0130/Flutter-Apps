import 'dart:math';

class CalculatorBrain {
  final double height;
  final int weight;
  double _bmi;
  CalculatorBrain(this.height, this.weight) {
    calculate();
  }
  calculate() {
    _bmi = weight / pow(height / 100, 2);
  }

  String result() {
    if (_bmi > 30)
      return 'OBESE';
    else if (_bmi > 25)
      return 'OVERWEIGHT';
    else if (_bmi > 18.5)
      return 'NORMAL';
    else
      return 'UNDERWEIGHT';
  }

  String bmiText() => _bmi.toStringAsFixed(1);
  String interpretation() {
    if (_bmi > 30)
      return 'Discuss With A Professional';
    else if (_bmi > 25)
      return 'Watch Your Diet And Exercise More';
    else if (_bmi > 18.5)
      return 'Keep Up Whatever You\'re Up to';
    else
      return 'Concentrate On Your Diet And Increase Your Weight';
  }
}
