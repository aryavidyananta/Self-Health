// ignore_for_file: file_names
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:my_self/Screen/AddTypes.dart';
// // ignore: unused_import
// import 'package:my_self/Screen/CRUDJurnal.dart';
// import 'package:my_self/Screen/CounterScreen/counter_screen.dart';
// import 'package:my_self/Screen/Course.dart';
// import 'package:my_self/Screen/DashBoard.dart';
// import 'package:my_self/Screen/Jurnal.dart';
// import 'package:my_self/Screen/WelcomeScreen/welcome_screen.dart';
// // ignore: unused_import
// import 'package:my_self/Screen/home.dart';
// // ignore: unused_import
// import 'package:my_self/Screen/news_screen.dart';
// import 'package:my_self/Screen/profile.dart';
// import 'package:my_self/Screen/routes/CustomerScreen.dart';
// import 'package:my_self/Screen/routes/DatasScreen.dart';
// import 'package:my_self/dto/routes/BalanceScreen/balance%20screen.dart';
// import 'package:my_self/dto/routes/SpendingScreen/spending_screen.dart';


// class BaseScreen extends StatefulWidget {
//   const BaseScreen({Key? key}) : super(key: key);

//   @override
//   State<BaseScreen> createState() => _BaseScreenState();
// }

// class _BaseScreenState extends State<BaseScreen> {
//   int _selectedIndex = 0; // set initial screen index here

//   final List<Widget> _screens = [
//     const FeaturedScreen(),
//     const JurnalScreen(),
//     DoctorListScreen(),
//     ProfileScreen(),
//   ];

//   final List<String> _appBarTitles = const [
//     "Home",
//     "Jurnal",
//     "Course",
//     "Profile",
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color.fromARGB(255, 47, 110, 255),
//           title: Text(_appBarTitles[_selectedIndex]),
//         ),
//         drawer: Drawer(
//             child: ListView(padding: EdgeInsets.zero, children: [
//           UserAccountsDrawerHeader(
//             accountName: Text(
//               'Arya Vidyananta',
//             ),
//             accountEmail: Text("arya@mail.com"),
//             currentAccountPicture: CircleAvatar(
//               child: ClipOval(
//                 child: Image.asset("assets/images/master.jpg",
//                     width: 90, height: 90, fit: BoxFit.cover),
//               ),
//             ),
//             decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 255, 255, 255),
//                 image: DecorationImage(
//                     image: AssetImage("assets/images/Drawer.jpeg"),
//                     fit: BoxFit.cover)),
//           ),
//           ListTile(
//             leading: Icon(Icons.favorite),
//             title: const Text('Latihan APII'),
//             selected: _selectedIndex == 0,
//             onTap: () {
//               _onItemTapped(0);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => MahasiswaScreen()),
//               );
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.favorite),
//             title: const Text('Latihan CRUD SQLITE'),
//             selected: _selectedIndex == 0,
//             onTap: () {
//               // Update the state of the app
//               _onItemTapped(0);
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => NotesScreen()));
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.favorite),
//             title: const Text('UP Images'),
//             selected: _selectedIndex == 0,
//             onTap: () {
//               // Update the state of the app
//               _onItemTapped(0);
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => DatasScreen()));
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.favorite),
//             title: const Text('UTS'),
//             selected: _selectedIndex == 0,
//             onTap: () {
//               // Update the state of the app
//               _onItemTapped(0);
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => CustomerServiceScreen()));
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.favorite),
//             title: const Text('Counter'),
//             selected: _selectedIndex == 0,
//             onTap: () {
//               // Update the state of the app
//               _onItemTapped(0);
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => CounterScreen()));
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.favorite),
//             title: const Text('welcome'),
//             selected: _selectedIndex == 0,
//             onTap: () {
//               // Update the state of the app
//               _onItemTapped(0);
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => WelcomeScreen()));
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.logout),
//             title: const Text('balance'),
//             selected: _selectedIndex == 0,
//             onTap: () {
//               // Update the state of the app
//               _onItemTapped(0);
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => BalanceScreen()));
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.logout),
//             title: const Text('spending'),
//             selected: _selectedIndex == 0,
//             onTap: () {
//               // Update the state of the app
//               _onItemTapped(0);
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => SpendingScreen()));
//             },
//           ),
//         ])),
//         body: _screens[_selectedIndex],
//         bottomNavigationBar: BottomNavigationBar(
//           items: <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.home,
//                 color: Colors.grey,
//               ),
//               activeIcon: Icon(
//                 Icons.home,
//                 color: Color.fromARGB(255, 62, 139, 255), // Active color
//               ),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.book_online_outlined,
//                 color: Colors.grey,
//               ),
//               activeIcon: Icon(
//                 Icons.book_online_outlined,
//                 color: Color.fromARGB(255, 62, 139, 255), // Active color
//               ),
//               label: 'Jurnal',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.video_call,
//                 color: Colors.grey,
//               ),
//               activeIcon: Icon(
//                 Icons.video_call,
//                 color: Color.fromARGB(255, 62, 139, 255), // Active color
//               ),
//               label: 'Course',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.person,
//                 color: Colors.grey,
//               ),
//               activeIcon: Icon(
//                 Icons.person,
//                 color: Color.fromARGB(255, 62, 139, 255), // Active color
//               ),
//               label: 'Profile',
//             ),
//           ],
//           currentIndex: _selectedIndex,
//           selectedItemColor: Color.fromARGB(255, 62, 139, 255),
//           unselectedItemColor: Colors.grey, // Color for unselected items
//           onTap: _onItemTapped, // add onTap callback
//           backgroundColor:
//               Colors.white, // Background color of the navigation bar
//           elevation: 10, // Elevation of the navigation bar
//         ));
//   }
// }
