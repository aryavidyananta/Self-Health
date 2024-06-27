// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_self/component/My_Buttom.dart';
import 'package:my_self/component/textfied.dart';
// Import MyButton widget

// ignore: use_key_in_widget_constructors
class RegisterScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _noTelpnController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _namaPenggunaController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rolesController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      final Map<String, String> newUser = {
        "No_Telpn": _noTelpnController.text,
        "email": _emailController.text,
        "nama_pengguna": _namaPenggunaController.text,
        "password": _passwordController.text,
        "roles": _rolesController.text,
        "username": _usernameController.text,
      };

      // Debug log
      // ignore: avoid_print
      print("Payload being sent: $newUser");

      final response = await http.post(
        Uri.parse('http://192.168.173.41:5000/api/v1/auth/register'),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: newUser,
      );

      // Debug log
      // ignore: avoid_print
      print("Response status: ${response.statusCode}");
      // ignore: avoid_print
      print("Response body: ${response.body}");

      if (response.statusCode == 201) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          // ignore: prefer_const_constructors
          SnackBar(content: Text('Registration successful')),
        );
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed: ${response.body}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              MyTextField(
                controller: _noTelpnController,
                hintText: 'No Telpn',
                obscureText: false,
              ),
              // ignore: prefer_const_constructors
              SizedBox(height: 20),
              MyTextField(
                controller: _emailController,
                hintText: 'Email',
                obscureText: false,
              ),
              // ignore: prefer_const_constructors
              SizedBox(height: 20),
              MyTextField(
                controller: _namaPenggunaController,
                hintText: 'Nama Pengguna',
                obscureText: false,
              ),
              // ignore: prefer_const_constructors
              SizedBox(height: 20),
              MyTextField(
                controller: _passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              // ignore: prefer_const_constructors
              SizedBox(height: 20),
              MyTextField(
                controller: _rolesController,
                hintText: 'Roles',
                obscureText: false,
              ),
              // ignore: prefer_const_constructors
              SizedBox(height: 20),
              MyTextField(
                controller: _usernameController,
                hintText: 'Username',
                obscureText: false,
              ),
              // ignore: prefer_const_constructors
              SizedBox(height: 50),
              MyButton(
                customColor: const Color.fromARGB(
                    255, 13, 143, 134), // Custom color for the button
                text: 'Register', // Button text
                onTap: _register, // Function to call on button tap
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Endpoints2 {
  static const String baseURLLive = "http://192.168.18.112:5000";
  static const String register = "$baseURLLive/api/v1/auth/register";
}
