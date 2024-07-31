import 'package:bmi_calculator_app/components/constants.dart';
import 'package:flutter/material.dart';

class BottomContainerButton extends StatelessWidget {
const BottomContainerButton({required this.title, required this.onTap});
    final String title;
    final Function() onTap;

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: const Color(0xFFEB1555),
        height: kButtonHeight,
        width: double.infinity,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),),
        ),
    ));
  
  }
}