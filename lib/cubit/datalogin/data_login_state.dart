part of 'data_login_cubit.dart';

@immutable
class DataLoginState {
  final String roles;
  // ignore: non_constant_identifier_names
  final int IdPengguna;

  const DataLoginState(
      // ignore: non_constant_identifier_names
      {required this.roles,
      // ignore: non_constant_identifier_names
      required this.IdPengguna,
      required});

  get profile => null;
}

final class DataLoginInitial extends DataLoginState {
  const DataLoginInitial() : super(IdPengguna: 0, roles: 'user');
}
