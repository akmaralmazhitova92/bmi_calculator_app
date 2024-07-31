
import 'dart:math';

import 'package:flutter/material.dart';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});
    final int height;
    final int weight;
    
    double bmi = 0;

String calculateBMI(){
  bmi = weight/ pow(height/100, 2);
  return bmi.toStringAsFixed(1);
}

String getResult(){
  if (bmi >= 25) {
    return 'Overweight';
  } else if(bmi > 18.5){
    return 'Normal';
  } else{
    return 'Underweight';
  }
}

String getAdvise(){
  if (bmi >= 25) {
    return 'You have a higher Body Mass Index than a normal person./n Try to exercise more.';
  } else if(bmi > 18.5){
    return 'You have a normal Body Mass Index. /n Try to keep it.';
  } else{
    return 'You have a lower Body Mass Index. /n Try to eat more.';
  }
}

Color getTextColor (){
  if (bmi >= 25 || bmi <= 18.5) {
    return Colors.deepOrangeAccent;
  } else {
    return const Color(0xFF24D876);
  }
}
}

