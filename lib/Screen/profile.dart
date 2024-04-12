import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_ujicoba/components/size_config.dart';
// import 'package:flutter_ujicoba/screens/Home.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage('assets/images/master.jpg'),
          ),
          const SizedBox(height: 20),
          itemProfile('Nama', 'Arya Vidyananta', CupertinoIcons.person),
          const SizedBox(height: 20),
          itemProfile('NIM', '2215091079', CupertinoIcons.number),
          const SizedBox(height: 20),
          itemProfile(
              'Prodi', 'Sistem Informasi', CupertinoIcons.building_2_fill),
          const SizedBox(height: 20),
          itemProfile('Mata Kuliah', 'Pemrograman Mobile', CupertinoIcons.book),
        ],
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Colors.deepOrange.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 5)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(
          Icons.arrow_forward,
          color: Colors.grey,
        ),
        tileColor: Colors.white,
      ),
    );
  }
}
