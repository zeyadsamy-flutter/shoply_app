import 'package:bloc/bloc.dart';

class ProductSelectedCubit extends Cubit<int> {
  ProductSelectedCubit() : super(0);
  void increment() => emit(state + 1);
}
