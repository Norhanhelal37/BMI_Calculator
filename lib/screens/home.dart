import "package:bmi/cubit/counter_cubit/counter_cubit.dart";
import "package:bmi/cubit/counter_cubit/counter_state.dart";
import "package:bmi/cubit/gender_cubit/gender_cubit.dart";
import "package:bmi/cubit/gender_cubit/gender_state.dart";
import "package:bmi/items/gender.dart";
import "package:bmi/screens/result_screen.dart";
import "package:bmi/items/weight_age.dart";

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        child: MultiBlocProvider(
          providers: [
            BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
            BlocProvider<GenderCubit>(create: (context) => GenderCubit())
          ],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<GenderCubit, GenderState>(
                  builder: (BuildContext context, GenderState state) {
                return Expanded(
                    child: SizedBox(
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Gender(
                        gender: "Male",
                        image: "assets/images/male.png",
                        isSelected: GenderCubit.get(context).isMale,
                        select: () {
                          GenderCubit.get(context).male();
                        },
                      ),
                      Gender(
                        gender: "Female",
                        image: "assets/images/female.png",
                        isSelected: !GenderCubit.get(context).isMale,
                        select: () {
                          GenderCubit.get(context).female();
                        },
                      )
                    ],
                  ),
                ));
              }),
              Expanded(
                  child: SizedBox(
                child: Container(
                    height: MediaQuery.sizeOf(context).height * .5,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: const BoxDecoration(
                        color: const Color(0xff24263B),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: BlocBuilder<CounterCubit, CountersState>(
                      builder: (BuildContext context, CountersState state) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Height",
                              style: TextStyle(
                                color: Color(0xff8B8C9E),
                                fontSize: 30,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${CounterCubit.get(context).hieght}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w700),
                                ),
                                const Text(
                                  "cm",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ],
                            ),
                            Slider(
                                min: 50,
                                max: 300,
                                value:
                                    CounterCubit.get(context).hieght.toDouble(),
                                divisions: 400,
                                allowedInteraction:
                                    SliderInteraction.tapAndSlide,
                                inactiveColor: Colors.white,
                                activeColor: const Color(0xffE83D67),
                                onChanged: (value) {
                                  CounterCubit.get(context)
                                      .assignheight(value.toInt());
                                })
                          ],
                        );
                      },
                    )),
              )),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: SizedBox(child: BlocBuilder<CounterCubit, CountersState>(
                  builder: (BuildContext context, CountersState state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        weight_age(
                          title: "Weight",
                          amount: CounterCubit.get(context).weight,
                          onadd: () {
                            CounterCubit.get(context).weightaddone();
                          },
                          onminus: () {
                            CounterCubit.get(context).weightminusone();
                          },
                        ),
                        weight_age(
                          title: "Age",
                          amount: CounterCubit.get(context).age,
                          onadd: () {
                            CounterCubit.get(context).ageaddone();
                          },
                          onminus: () {
                            CounterCubit.get(context).ageminusone();
                          },
                        )
                      ],
                    );
                  },
                )),
              ),
              SizedBox(
                child: Container(
                    height: 70,
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 10),
                    color: const Color(0xffE83D67),
                    child: BlocBuilder<CounterCubit, CountersState>(
                      builder: (BuildContext context, CountersState state) {
                        return TextButton(
                          onPressed: () {
                            double bmi =
                                (CounterCubit.get(context).weight) / ((CounterCubit.get(context).hieght / 100) * (CounterCubit.get(context).hieght / 100));
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return ResultScreen(
                                result: bmi,
                              );
                            }));
                          },
                          child: const Text(
                            "Calculate",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w600),
                          ),
                        );
                      },
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
