import 'package:bmi/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C2135),
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
                SizedBox(width: 30,),
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
                margin:const EdgeInsets.all(20),
                height: 700,
                width: 400,
                decoration:const BoxDecoration(
                    color: const Color(0xff333244),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child:const Center(
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Normal",
                        style: TextStyle(
                            color: Color(0xff21BF73),
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "19.2",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 64,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "You Have A Normal Body Weight , Good Job",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff8B8C9E),
                            fontSize: 16,
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
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) {
                        return const HomeScreen();
                      }));
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
