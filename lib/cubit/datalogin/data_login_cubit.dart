import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'data_login_state.dart';

class DataLoginCubit extends Cubit<DataLoginState> {
  // ignore: prefer_const_constructors
  DataLoginCubit() : super(DataLoginInitial());

  // ignore: non_constant_identifier_names
  void setProfile(String roles, int IdPengguna) {
    emit(DataLoginState(roles: roles, IdPengguna: IdPengguna));
  }
}
