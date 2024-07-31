import 'package:bmi_calculator_app/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum Gender {
  male, 
  female}
Gender? selectedGender;

class IconContent extends StatelessWidget {
 
  const IconContent({required this.icon, required this.label,super.key});

 final IconData icon;
 final String label;




  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,),
        
        const SizedBox(
          height:15.0 ,),
        
        Text(
          label.toUpperCase(),
           style: klabelStyle
        ),
        
      ],
    );
  }
}