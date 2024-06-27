// ignore_for_file: file_names

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:my_self/Screen/Jurnal.dart';
import 'package:my_self/Screen/MindHaven/JurnalDokter.dart';
import 'package:my_self/Screen/MindHaven/addquiet.dart';
// ignore: unused_import
import 'package:my_self/Screen/MindHaven/meditasiScreen.dart';
import 'package:my_self/Screen/home.dart';
import 'package:my_self/Screen/profile.dart';

class HomeDokter extends StatefulWidget {
  const HomeDokter({super.key});

  @override
  State<HomeDokter> createState() => _HomeDokterState();
}

class _HomeDokterState extends State<HomeDokter> {
  int currentTab = 0; // set initial screen index here

  final List<Widget> _screens = [
    const HomeScreen(),
    AddAudioScreen(),
    const JurnalDokter(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentTab = index;
      currentScreen = _screens[index];
    });
  }

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentScreen),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        // ignore: sized_box_for_whitespace
        child: Container(
          height: 70, // Increased height to accommodate content properly
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly, // Distribute buttons evenly
            children: <Widget>[
              buildMaterialButton(icon: Icons.home, label: 'Home', index: 0),
              buildMaterialButton(
                  icon: Icons.dashboard, label: 'Meditasi', index: 1),
              buildMaterialButton(icon: Icons.book, label: 'Jurnal', index: 2),
              buildMaterialButton(
                  icon: Icons.person, label: 'Profil', index: 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMaterialButton(
      {required IconData icon, required String label, required int index}) {
    return MaterialButton(
      minWidth: 40,
      onPressed: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: currentTab == index ? 30 : 30,
            width: currentTab == index ? 30 : 30,
            decoration: BoxDecoration(
              color: currentTab == index
                  ? const Color.fromARGB(255, 0, 165, 110).withOpacity(0.2)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              icon,
              color: currentTab == index
                  ? const Color.fromARGB(255, 0, 165, 110)
                  : Colors.grey,
            ),
          ),
          // ignore: prefer_const_constructors
          SizedBox(height: 4), // Added space between icon and text
          Text(
            label,
            style: TextStyle(
                color: currentTab == index
                    ? const Color.fromARGB(255, 0, 165, 110)
                    : Colors.grey),
          )
        ],
      ),
    );
  }
}
