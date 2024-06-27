// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';

// class VideoSection extends StatelessWidget {
//   List videoList = [
//     'Tips hidup sehar',
//     'pengembangan diri',
//     'Potensi diri'
//         'minat bakat'
//   ];

//   VideoSection({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: videoList.length,
//       physics: NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemBuilder: (context, index) {
//         return ListTile(
//           leading: Container(
//             padding: EdgeInsets.all(5),
//             decoration: BoxDecoration(
//                 color: index == 0
//                     ? Color(0xFF674AEF)
//                     : Color(0xFF674AEF).withOpacity(0.6),
//                 shape: BoxShape.circle),
//             child: Icon(
//               Icons.play_arrow_rounded,
//               color: Color.fromARGB(255, 254, 253, 253),
//               size: 30,
//             ),
//           ),
//           title: Text(videoList[index]),
//           subtitle: Text("20 min 50 sec"),
//         );
//       },
//     );
//   }
// }
