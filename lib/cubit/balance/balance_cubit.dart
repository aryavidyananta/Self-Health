import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:meta/meta.dart';
import 'package:my_self/dto/Balance.dart';
import 'package:my_self/service/data_service.dart';
import 'package:flutter/widgets.dart';

part 'balance_state.dart';

class BalanceCubit extends Cubit<BalanceState> {
  BalanceCubit() : super(const BalanceInitialState());

  Future<void> fetchBalance() async {
    try {
      debugPrint("fire api");
      int fetchedBalance;
      List<Balances>? balances;
      balances = await DataService.fetchbalances();
      fetchedBalance = balances[0].balance;
      emit(BalanceState(balance: fetchedBalance));
    } catch (e) {
      debugPrint("Error fetched data");
    }
  }

  void updateBalance(int spending) {
    final int newBalance = state.balance - spending;
    emit(BalanceState(balance: newBalance));
  }
}
