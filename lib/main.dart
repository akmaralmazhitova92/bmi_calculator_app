import 'package:bmi_calculator_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
          primaryColor: const Color(0xFF0A0E21),
          scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      
      home:  const HomeScreen(),
    ); 
  }
}
