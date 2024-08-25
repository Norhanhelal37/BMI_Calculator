import 'package:bmi/cubit/counter_cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CountersState> {
  CounterCubit() : super(IncreaseCountersState());

  static CounterCubit get(context) => BlocProvider.of(context);

  int weight = 20;
  int hieght = 50;
  int age = 10;

  void weightaddone() {
    if (weight > 300) {
      weight = 300;
    } else {
      weight += 1;
    }

    emit(IncreaseCountersState());
  }

  void weightminusone() {
    if (weight <= 20) {
      weight = 20;
    } else {
      weight -= 1;
    }
    emit(MinusCounterState());
  }

  void ageaddone() {
    age += 1;
    emit(IncreaseCountersState());
  }

  void ageminusone() {
    if (age <= 1) {
      age = 1;
    } else {
      age -= 1;
    }
    emit(MinusCounterState());
  }

  void assignheight(int value) {
    hieght = value;
    emit(HieghtState());
  }
}
