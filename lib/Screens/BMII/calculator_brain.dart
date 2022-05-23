import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25 /*|| _bmi < 29.9*/) {
      return 'Overweight';
    } else if (_bmi >= 18.5 /*|| _bmi < 24.9*/) {
      return 'Normal';
    } else if (_bmi >= 30) {
      return 'Obese !!';
    }  else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.\n To be fit you need to know your daily maintenance\n calories and that can be achieved by checking your BMR';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!\nDespite of that you need to check your fat %';
    } else if (_bmi >= 30) {
      return 'You have a very high body weight. FOCUS & Try to exercise more.\n To be fit you need to know your daily maintenance\n calories and that can be achieved by checking your BMR';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}