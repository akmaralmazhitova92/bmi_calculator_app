import 'package:bmi_calculator_app/components/bottomContainer_button.dart';
import 'package:bmi_calculator_app/components/constants.dart';
import 'package:bmi_calculator_app/components/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
const ResultPage({super.key, required this.resultText, required this.bmi, required this.advise, required this.textColor});
  final String resultText;
  final String bmi;
  final String advise;
  final Color textColor;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomCenter,
              child: const Text('Your Result',
              style: klabelStyle,),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(resultText,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 27.0,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text(bmi,
                  style: const TextStyle(
                    fontSize: 100.0,
                    fontWeight: FontWeight.bold,
                  ),),
                  const Text('18.5 - 25 kg/m2',
                  style: TextStyle(
                    fontSize: 22.0,
                  ),),
                  Text(advise,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22.0,
                  ),),
                  const SizedBox(
                    height: 15.0,
                  ),
                  RawMaterialButton(onPressed: (){},
                  constraints: const BoxConstraints.tightFor(
                    width: 200.0,
                    height: 56.0,
                  ),
                  fillColor: const Color(0xFF4C4F5E),
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: const Text('SAVE RESULT',
                  style: TextStyle(
                    fontSize: 22.0,
                  ),),),

                  BottomContainerButton(
                    title: 'Re- Calculate', 
                    onTap: (){
                      Navigator.pop(context);
                    })
                ],
              ),))
        ],
      ),
    );
  }
}