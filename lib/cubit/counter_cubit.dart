import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: unnecessary_import
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  // ignore: prefer_const_constructors
  CounterCubit() : super(CounterInitialState());

  void increment() {
    final int newCounter = state.counter + 1;
    final String newStatus = newCounter % 2 == 0 ? 'genap' : 'ganjil';
    final Color newColor = newCounter % 2 == 0 ? Colors.red : Colors.green;
    emit(CounterState(counter: newCounter, status: newStatus, color: newColor));
  }

  void decrement() {
    final int newCounter = state.counter - 1;
    final String newStatus = newCounter % 2 == 0 ? 'genap' : 'ganjil';
    final Color newColor = newCounter % 2 == 0 ? Colors.red : Colors.green;
    emit(CounterState(counter: newCounter, status: newStatus, color: newColor));
  }
}
