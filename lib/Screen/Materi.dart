// ignore_for_file: file_names
// import 'package:flutter/material.dart';
// import 'package:my_self/widgets/desc.dart';

// import 'package:my_self/widgets/video.dart';

// class MateriScreen extends StatefulWidget {
//   const MateriScreen(imgData, {super.key});

//   @override
//   State<MateriScreen> createState() => _MateriScreenState();
// }

// class _MateriScreenState extends State<MateriScreen> {
//   bool isVideosSections = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         foregroundColor: Colors.black,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//         child: ListView(
//           children: [
//             Container(
//               padding: EdgeInsets.all(5),
//               width: MediaQuery.of(context).size.width,
//               height: 200,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Color.fromARGB(255, 121, 146, 253),
//                   image: DecorationImage(
//                       image: AssetImage("assets/images/health.png"))),
//               child: Center(
//                 child: Container(
//                   padding: EdgeInsets.all(5),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Icon(
//                     Icons.play_arrow_rounded,
//                     color: Color(0xFF674AEF),
//                     size: 45,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 15),
//             Text(
//               "Complete Course",
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Text(
//               "Created by Dear Programer",
//               style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black.withOpacity(0.7)),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Text(
//               "5 Videos",
//               style: TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black.withOpacity(0.5),
//               ),
//             ),
//             SizedBox(height: 20),
//             Container(
//               padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
//               decoration: BoxDecoration(
//                   color: Color(0xFFF5F3FF),
//                   borderRadius: BorderRadius.circular(10)),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Material(
//                     color: isVideosSections
//                         ? Color(0xFF674AEF)
//                         : Color(0xFF674AEF).withOpacity(0.6),
//                     borderRadius: BorderRadius.circular(10),
//                     child: InkWell(
//                       onTap: () {
//                         isVideosSections = false;
//                       },
//                       child: Container(
//                         padding:
//                             EdgeInsets.symmetric(vertical: 15, horizontal: 35),
//                         child: Text(
//                           "Videos",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Material(
//                     color: isVideosSections
//                         ? Color(0xFF674AEF).withOpacity(0.6)
//                         : Color(0xFF674AEF),
//                     borderRadius: BorderRadius.circular(10),
//                     child: InkWell(
//                       onTap: () {
//                         setState(() {
//                           isVideosSections = false;
//                         });
//                       },
//                       child: Container(
//                         padding:
//                             EdgeInsets.symmetric(vertical: 15, horizontal: 35),
//                         child: Text(
//                           "Description",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             isVideosSections ? VideoSection() : DescriptionSection(),
//           ],
//         ),
//       ),
//     );
//   }
// }
