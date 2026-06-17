import 'package:bazzar_app/features/Books/presentation/cubit/quantity_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuantityCubit extends Cubit<QuantityState> {
  QuantityCubit(double bookPrice)
    : super(QuantityState(quantity: 1, price: bookPrice));

  void increment() {
    emit(QuantityState(quantity: state.quantity + 1, price: state.price));
  }

  void decrement() {
    if (state.quantity > 1) {
      emit(QuantityState(quantity: state.quantity - 1, price: state.price));
    }
  }
}
