import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.result});
  final double result;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

String Range(double bmi) {
  if (bmi < 16) {
    return "Severe Thininess";
  }
  if (bmi >= 16 && bmi < 17) {
    return "Moderate Thininess";
  }
  if (bmi >= 17 && bmi < 19) {
    return "Mild Thininess";
  }
  if (bmi >= 19 && bmi < 25) {
    return "Normal";
  }
  if (bmi >= 25 && bmi < 30) {
    return "OverWeight";
  }
  if (bmi >= 30 && bmi < 35) {
    return "Obese Class I";
  }
  if (bmi >= 35 && bmi < 40) {
    return "Obese Class II";
  }

  return "Obese Class III";
}


String Advice(String range){
 if(range == "Severe Thininess"){
   
    return "Very bad result , You have to visit your doctor";

 }
  
  if (range =="Moderate Thininess") {
    return  "Please you have to play more sports";
  }
  if (range == "Mild Thininess") {
    return "Please you should eat balanced meals" ;
  }
  if (range == "Normal") {
    return "You Have A Normal Body Weight , Good Job";
  }
  if (range == "OverWeught") {
    return "You have to loss weight";
  }
  if (range == "Obese Class I") {
    return "You need balanced food and play Sports";
  }
  if(range == "Obese Class II") {
    return "You need to visit your doctor " ;
  }

  return "You must visit your doctor , this result is very dangerous";


}

class _ResultScreenState extends State<ResultScreen> {

  @override
  Widget build(BuildContext context) {
  String res = Range(widget.result);
    return Scaffold(
      backgroundColor: const Color(0xff1C2135),
      appBar: AppBar(
        backgroundColor: const Color(0xff24263B),
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Your Results",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer()
              ],
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: const EdgeInsets.all(20),
                height: 700,
                width: 400,
                decoration: const BoxDecoration(
                    color: const Color(0xff333244),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        Range(widget.result),
                        style:const TextStyle(
                            color: Color(0xff21BF73),
                            fontSize: 30,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "${widget.result.roundToDouble()}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 64,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        Advice(res),
                        textAlign: TextAlign.center,
                        style:const TextStyle(
                            color: Color(0xff8B8C9E),
                            fontSize: 26,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: Container(
                  height: 100,
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 20),
                  color: const Color(0xffE83D67),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Re Calculate",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
