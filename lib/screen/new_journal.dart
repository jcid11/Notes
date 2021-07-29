import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_project/tag_function.dart';
import 'package:note_project/utilities/constant.dart';

// class NewJournal extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         iconTheme: iconAppColor,
//         title: Row(
//           children: <Widget>[Expanded(child: SizedBox()), Icon(Icons.check)],
//         ),
//       ),
//       body: newJournalBody(),
//     );
//   }
// }
//
// class newJournalBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(left:8.0),
//             child: TextFormField(
//               decoration: InputDecoration(
//                   border: InputBorder.none,
//                   focusedBorder: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   errorBorder: InputBorder.none,
//                   disabledBorder: InputBorder.none,
//                   hintText: 'title'),
//             ),
//           ),
//           tagWidget(),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                     border: Border.all(color: Colors.blueGrey,width: 3),
//                     borderRadius: BorderRadius.all(Radius.circular(20))
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left:8.0,right: 8,bottom: 8),
//                   child: TextField(
//                     cursorHeight: 25,
//                     maxLines: null,
//                     showCursor: true,
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       focusedBorder: InputBorder.none,
//                       enabledBorder: InputBorder.none,
//                       errorBorder: InputBorder.none,
//                       disabledBorder: InputBorder.none,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
