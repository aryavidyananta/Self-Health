import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_self/Screen/Base.dart';
import 'package:my_self/Screen/CounterScreen/counter_screen.dart';
import 'package:my_self/Screen/Login.dart';
import 'package:my_self/Screen/MindHaven/HomeScreen.dart';
// ignore: unused_import
import 'package:my_self/Screen/MindHaven/ProfilDokterScreen.dart';
import 'package:my_self/Screen/MindHaven/SplashScreen.dart';
import 'package:my_self/Screen/MindHaven/quietflow.dart';
import 'package:my_self/Screen/MindHaven/relaxition.dart';
import 'package:my_self/Screen/SignUpScreen.dart';
import 'package:my_self/Screen/WelcomeScreen/welcome_screen.dart';
// ignore: unused_import
import 'package:my_self/Screen/home.dart';
import 'package:my_self/Screen/routes/DatasScreen.dart';
// ignore: unused_import
import 'package:my_self/Screen/started.dart';
// ignore: unused_import
import 'package:my_self/cubit/SignUp/sing_up_cubit.dart';
import 'package:my_self/cubit/auth/auth_cubit.dart';
import 'package:my_self/cubit/balance/balance_cubit.dart';
import 'package:my_self/cubit/counter_cubit.dart';
import 'package:my_self/cubit/datalogin/data_login_cubit.dart';
import 'package:my_self/dto/routes/BalanceScreen/balance%20screen.dart';
import 'package:my_self/dto/routes/SpendingScreen/spending_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_super_parameters
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => BalanceCubit()),
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
        BlocProvider<DataLoginCubit>(create: (context) => DataLoginCubit()),
        //BlocProvider<SignUpCubit>(create: (context) => SignUpCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(), // Customize theme as needed
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        initialRoute: '/',
        routes: {
          '/base': (context) => const BaseScreen(),
          '/datas-screen': (context) => const DatasScreen(),
          '/welcome-screen': (context) => const WelcomeScreen(),
          '/counter-screen': (context) => const CounterScreen(),
          '/balance-screen': (context) => const BalanceScreen(),
          '/spending-screen': (context) => const SpendingScreen(),
          '/login-screen': (context) => const LoginScreen(),
          '/home-screen': (context) => const ButtomScreen(),
          '/quiet-flow': (context) => QuietFlowScreen(),
          // '/relaxation-music': (context) => RelaxationMusicScreen(),
          '/signup-screen': (context) => RegisterScreen(),
          //'/profil-dokter': (context) => const DetailDokterScreen(),
        },
      ),
    );
  }
}
