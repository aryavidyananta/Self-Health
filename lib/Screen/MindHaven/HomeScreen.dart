// ignore: unused_import
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_self/Screen/Course.dart';
// ignore: unused_import
import 'package:my_self/Screen/DashBoard.dart';
import 'package:my_self/Screen/Jurnal.dart';
import 'package:my_self/Screen/MindHaven/meditasiScreen.dart';
import 'package:my_self/Screen/home.dart';
import 'package:my_self/Screen/profile.dart';
// ignore: unused_import
import 'package:my_self/dto/routes/SpendingScreen/spending_screen.dart';
// ignore: unused_import

class ButtomScreen extends StatefulWidget {
  const ButtomScreen({super.key});

  @override
  State<ButtomScreen> createState() => _ButtomScreenState();
}

class _ButtomScreenState extends State<ButtomScreen> {
  // ignore: unused_field
  int currentTab = 0; // set initial screen index here

  // ignore: unused_field
  final List<Widget> _screens = [
    const HomeScreen(),
    MeditasiScreen(),
    const DoctorListScreen(),
    ProfileScreen(),
  ];

  // ignore: unused_element
  void _onItemTapped(int index) {
    setState(() {
      currentTab = index;
    });
  }

  // ignore: unused_field
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentScreen),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            currentScreen = const JurnalScreen();
            currentTab = 0;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        // ignore: sized_box_for_whitespace
        child: Container(
          height: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const HomeScreen();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.home,
                          color: currentTab == 0
                              ? const Color.fromARGB(255, 0, 165, 110)
                              : Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                              color: currentTab == 0
                                  ? const Color.fromARGB(255, 0, 165, 110)
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = MeditasiScreen();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: currentTab == 1
                              ? const Color.fromARGB(255, 0, 165, 110)
                              : Colors.grey,
                        ),
                        Text(
                          'Meditasi',
                          style: TextStyle(
                              color: currentTab == 1
                                  ? const Color.fromARGB(255, 0, 165, 110)
                                  : Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const DoctorListScreen();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.inbox,
                          color: currentTab == 2
                              ? const Color.fromARGB(255, 0, 165, 110)
                              : Colors.grey,
                        ),
                        Text(
                          'Konsul',
                          style: TextStyle(
                              color: currentTab == 2
                                  ? const Color.fromARGB(255, 0, 165, 110)
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = ProfileScreen();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.person,
                          color: currentTab == 3
                              ? const Color.fromARGB(255, 0, 165, 110)
                              : Colors.grey,
                        ),
                        Text(
                          'Profil',
                          style: TextStyle(
                              color: currentTab == 3
                                  ? const Color.fromARGB(255, 0, 165, 110)
                                  : Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
