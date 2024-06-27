// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: unused_import
import 'package:my_self/Screen/Base.dart';
import 'package:my_self/component/My_Buttom.dart';
import 'package:my_self/component/constant.dart';
import 'package:my_self/component/secure_storage_utils.dart';
import 'package:my_self/component/textfied.dart';
import 'package:my_self/cubit/auth/auth_cubit.dart';
import 'package:my_self/cubit/datalogin/data_login_cubit.dart';
// ignore: unused_import
import 'package:my_self/dto/datalogin.dart';
import 'package:my_self/dto/login.dart';
import 'package:my_self/service/data_service.dart';

class LoginScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void sendLogin(BuildContext context, AuthCubit authCubit,
      DataLoginCubit dataLogin) async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    final response = await DataService.sendLoginData(username, password);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final loggedIn = Login.fromJson(data);
      await SecureStorageUtil.storage
          .write(key: tokenStoreName, value: loggedIn.accessToken);
      authCubit.login(loggedIn.accessToken);
      // ignore: use_build_context_synchronously
      getProfile(dataLogin, loggedIn.accessToken, context);
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Failed. Please try again.')),
      );
    }
  }

  void getProfile(
      DataLoginCubit profileCubit, String? accessToken, BuildContext context) {
    if (accessToken == null) {
      return;
    }

    DataService.fetchProfile(accessToken).then((profile) {
      profileCubit.setProfile(profile.roles, profile.userLogged);
      profileCubit.state.roles == 'user'
          ? Navigator.pushReplacementNamed(context, '/home-screen')
          : Navigator.pushReplacementNamed(context, '/Dokter-screen');
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error fetching profile')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    final dataLogin = BlocProvider.of<DataLoginCubit>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 13, 143, 134),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    "assets/images/Logomind.png",
                    width: 200,
                  ),
                  const SizedBox(height: 80),
                  MyTextField(
                    controller: _usernameController,
                    hintText: "username",
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    controller: _passwordController,
                    hintText: "Password",
                    obscureText: _obscurePassword,
                    icon: _obscurePassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  const SizedBox(height: 12),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Remember Me",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Color.fromARGB(255, 13, 143, 134),
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                  MyButton(
                    customColor: const Color.fromARGB(255, 13, 143, 134),
                    text: "Sign In",
                    onTap: () {
                      sendLogin(context, authCubit, dataLogin);
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Belum Punya Akun?",
                        style: TextStyle(color: Colors.black),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup-screen');
                        },
                        child: const Text(
                          "Buat Akun",
                          style: TextStyle(
                            color: Color.fromARGB(255, 13, 143, 134),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 13, 143, 134),
              onPressed: () {
                Navigator.pushNamed(context, '/config-screen');
              },
              child: const Icon(Icons.wifi),
            ),
          ),
        ],
      ),
    );
  }
}
