// ignore_for_file: file_names
// // ignore_for_file: unused_import

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// // ignore: duplicate_ignore
// // ignore: unused_import
// import 'package:my_self/Screen/Course.dart';
// import 'package:my_self/Screen/Course_Screen2.dart';
// import 'package:my_self/constants/Colors2.dart';
// import 'package:my_self/models/category.dart';
// // ignore: duplicate_ignore
// // ignore: unused_import
// import 'package:my_self/widgets/Search.dart';

// import '../constants/size.dart';
// // ignore: duplicate_ignore
// // ignore: unused_import
// import '../widgets/circle_butom.dart';
// import 'Materi.dart';

// class FeaturedScreen extends StatefulWidget {
//   const FeaturedScreen({Key? key}) : super(key: key);

//   @override
//   _FeaturedScreenState createState() => _FeaturedScreenState();
// }

// class _FeaturedScreenState extends State<FeaturedScreen> {
//   @override
//   Widget build(BuildContext context) {
//     // ignore: prefer_const_constructors
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: SystemUiOverlayStyle.light,
//       // ignore: prefer_const_constructors
//       child: Scaffold(
//         // ignore: prefer_const_constructors
//         body: SingleChildScrollView(
//           // ignore: prefer_const_constructors
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             // ignore: prefer_const_literals_to_create_immutables
//             children: [
//               //AtasBar(),
//               Body(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Body extends StatelessWidget {
//   const Body({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Explore Categories",
//                 style: Theme.of(context).textTheme.bodyLarge,
//               ),
//               TextButton(
//                 onPressed: () {},
//                 child: Text(
//                   "See All",
//                   style: Theme.of(context)
//                       .textTheme
//                       .bodyMedium
//                       ?.copyWith(color: kPrimaryColor),
//                 ),
//               )
//             ],
//           ),
//         ),
//         GridView.builder(
//           shrinkWrap: true,
//           padding: const EdgeInsets.symmetric(
//             horizontal: 20,
//             vertical: 8,
//           ),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: 0.8,
//             crossAxisSpacing: 20,
//             mainAxisSpacing: 24,
//           ),
//           itemBuilder: (context, index) {
//             return CategoryCard(
//               category: categoryList[index],
//             );
//           },
//           itemCount: categoryList.length,
//         ),
//       ],
//     );
//   }
// }

// class CategoryCard extends StatelessWidget {
//   final Category category;
//   const CategoryCard({
//     Key? key,
//     required this.category,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => CourseScreen2(),
//         ),
//       ),
//       child: Container(
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: Color.fromARGB(255, 198, 218, 255),
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(.1),
//               blurRadius: 4.0,
//               spreadRadius: .05,
//             ), //BoxShadow
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Align(
//               alignment: Alignment.topRight,
//               child: Image.asset(
//                 category.thumbnail,
//                 height: kCategoryCardImageSize,
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Text(category.name),
//             Text(
//               "${category.noOfCourses.toString()} courses",
//               style: Theme.of(context).textTheme.bodySmall,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
