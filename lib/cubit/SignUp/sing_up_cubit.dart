// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:my_self/dto/user.dart';
// import 'package:my_self/service/data_service.dart';

// import 'sing_up_state.dart';

// class SignUpCubit extends Cubit<SignUpState> {
//   SignUpCubit() : super(SignUpInitial());

//   Future<void> signUpUser(String namaPengguna, String noTelpn, String email,
//       String password, String username) async {
//     try {
//       emit(SignUpLoading());
//       final user = await DataService.createUser(password, username);
//       emit(SignUpSuccess(user));
//     } catch (e) {
//       emit(SignUpFailure(e.toString()));
//     }
//   }
// }
