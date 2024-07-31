import 'package:bmi_calculator_app/components/bottomContainer_button.dart';
import 'package:bmi_calculator_app/components/constants.dart';
import 'package:bmi_calculator_app/components/icon_content.dart';
import 'package:bmi_calculator_app/components/reusable_card.dart';
import 'package:bmi_calculator_app/components/round_icon_button.dart';
import 'package:bmi_calculator_app/screens/calculator_brain.dart';
import 'package:bmi_calculator_app/screens/result_page.dart';
import 'package:flutter/material.dart';

enum Gender {
  male, 
  female, 
  nonChoosen}

class HomeScreen extends StatefulWidget {
  const HomeScreen({ super.key });


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body:  Column(
        children: [
          Expanded(
            child: Row(
              children: [

                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    } ,
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild: const IconContent(
                      icon: Icons.male, 
                      label: 'MALE',
            
                      ),
               )),

                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInActiveCardColor,
                        cardChild: const IconContent(
                          icon: Icons.female, 
                          label: 'FEMALE'),))
                        ],),),
      
               Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('HEIGHT',
                      style: klabelStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: const Color(0xFF8E8D98),
                          thumbColor: const Color(0xFFEB1555),
                          thumbShape: 
                            const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: 
                            const RoundSliderOverlayShape(overlayRadius: 30.0),
                          overlayColor: const Color(0x29EB1555),
                      ),
                  
                        child: Slider(
                          value: height.toDouble(),
                            min: 120,
                            max: 220,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                  
                        ))
                    ],
                  ),
              )),

               Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            const Text('WEIGHT',
                            style: klabelStyle,),

                            Text(
                               weight.toString(),
                               style: kNumberTextStyle,),

                             Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: Icons.add, 
                                  onPressed:() {
                                    setState(() {
                                      weight++;
                                    });
                                  },),

                                  const SizedBox( width: 10.0,),
                                RoundIconButton(
                                  icon: Icons.remove, 
                                  onPressed: (){
                                    setState(() {
                                      weight--;
                                    });
                                  })
                                  
                                
                              ],
                            )
                          ],
                        ),),),
                         Expanded(
                          child: ReusableCard(
                            colour: kActiveCardColor,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'AGE',
                                style: klabelStyle,),
                                Text(
                                  age.toString(),
                                  style: kNumberTextStyle, ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(
                                      icon: Icons.add, 
                                      onPressed: (){
                                      setState(() {
                                        age++;
                                      });
                                    }),
                                     const SizedBox(width: 10.0,),
                                     RoundIconButton(
                                      icon: Icons.remove, 
                                      onPressed: (){
                                      setState(() {
                                        age--;
                                      });
                                     })

                                  ],
                                )
                              ],
                            ),),
                            )
                  ],)),
                  BottomContainerButton(
                    title: 'CALCULATE', 
                    onTap: (){
                      CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

                      final bmi = calc.calculateBMI();

                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => ResultPage(
                          resultText: calc.getResult(), 
                          bmi: bmi, 
                          advise: calc.getAdvise(), 
                          textColor: calc.getTextColor())));
                    },
          )
        ],
              
            ),
          
        
      
    );
  }
}