import 'package:bmi/cubit/gender_cubit/gender_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderCubit extends Cubit<GenderState> {
  GenderCubit() : super(MaleFemaleState());

  static GenderCubit get(Context) => BlocProvider.of(Context);

  bool isMale = true;

  void female() {
    isMale = false;
    emit(MaleFemaleState());
  }

  void male() {
    isMale = true;
    emit(MaleFemaleState());
  }
}
