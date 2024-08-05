import "package:bmi/items/gender.dart";
import "package:bmi/screens/result_screen.dart";
import "package:bmi/items/weight_age.dart";

import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _height = 0;
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
        padding: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(
                child: SizedBox(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Gender(
                    gender: "Male",
                    image: "assets/images/male.png",
                  ),
                  Gender(
                    gender: "Female",
                    image: "assets/images/female.png",
                  )
                ],
              ),
            )),
            Expanded(
                child: SizedBox(
              child: Container(
                height: 199,
                width: 330,
                decoration: const BoxDecoration(
                    color: const Color(0xff24263B),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Height",
                      style: TextStyle(
                        color: Color(0xff8B8C9E),
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$_height",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w700),
                        ),
                        const Text(
                          "cm",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                    Slider(
                        min: 0,
                        max: 400,
                        value: _height.toDouble(),
                        divisions: 400,
                        allowedInteraction: SliderInteraction.tapAndSlide,
                        inactiveColor: Colors.white,
                        activeColor: const Color(0xffE83D67),
                        onChanged: (value) {
                          setState(() {
                            _height = value.toInt();
                          });
                        })
                  ],
                ),
              ),
            )),
            const SizedBox(
              height: 10,
            ),
            const Expanded(
              child: const SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    weight_age(
                      title: "Weight",
                    ),
                    weight_age(title: "Age")
                  ],
                ),
              ),
            ),
            SizedBox(
              child: Container(
                height: 70,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                color: const Color(0xffE83D67),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return const ResultScreen();
                    }));
                  },
                  child: const Text(
                    "Calculate",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w600),
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
