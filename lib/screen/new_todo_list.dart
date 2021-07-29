import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_project/tag_function.dart';
import 'package:note_project/utilities/constant.dart';
//
// class NewToDoList extends StatelessWidget {
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
//       body: newTodoListBody(),
//     );
//   }
// }
//
// class newTodoListBody extends StatefulWidget {
//   @override
//   _newTodoListBody createState() => _newTodoListBody();
// }
//
// class _newTodoListBody extends State<newTodoListBody> {
//   var titleConttroller = TextEditingController();
//   bool checkoption = false;
//   IconData iconoption = Icons.check_box_outlined;
//   bool test = true;
//   List<Widget> listElementArray = [];
//
//   checkMetod() {
//     if (checkoption == true) {
//       iconoption = Icons.check_box_outline_blank;
//       return iconoption;
//     } else {
//       iconoption = Icons.check_box_outlined;
//       return iconoption;
//     }
//   }
//
//   List<Widget> getList() {
//     Widget testVariable = Padding(
//       padding: const EdgeInsets.only(top: 20.0, left: 2),
//       child: Row(
//         children: [
//           IconButton(
//               icon: Icon(
//                 checkMetod(),
//                 color: Colors.blueGrey,
//               ),
//               onPressed: () {
//                 setState(() {
//                   checkoption = !checkoption;
//                 });
//               }),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.only(left: 2.0, right: 28),
//               child: Container(
//                   decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey),
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 12.0),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                           border: InputBorder.none,
//                           focusedBorder: InputBorder.none,
//                           enabledBorder: InputBorder.none,
//                           errorBorder: InputBorder.none,
//                           disabledBorder: InputBorder.none,
//                           hintText: 'List element'),
//                     ),
//                   )),
//             ),
//           )
//         ],
//       ),
//     );
//     listElementArray.add(testVariable);
//     return listElementArray;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(left: 8.0),
//             child: TextFormField(
//               controller: titleConttroller,
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
//           Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 20.0, left: 2),
//                 child: Row(
//                   children: [
//                     IconButton(
//                         icon: Icon(
//                           checkMetod(),
//                           color: Colors.blueGrey,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             checkoption = !checkoption;
//                           });
//                         }),
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 2.0, right: 28),
//                         child: Container(
//                             decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.grey),
//                                 borderRadius: BorderRadius.circular(10)),
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 12.0),
//                               child: TextFormField(
//                                 decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                     focusedBorder: InputBorder.none,
//                                     enabledBorder: InputBorder.none,
//                                     errorBorder: InputBorder.none,
//                                     disabledBorder: InputBorder.none,
//                                     hintText: 'List element'),
//                               ),
//                             )),
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: listElementArray.length,
//               scrollDirection: Axis.vertical,
//               itemBuilder: (BuildContext context, int index) {
//                 return Column(
//                   children: listElementArray
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 52.0, top: 20, right: 30),
//             child: ElevatedButton(
//               onPressed: () {
//                 test = !test;
//                 print(test);
//                 setState(() {
//                   if (test == false) {
//                     return getList();
//                   } else {
//                     return getList();
//                   }
//                 });
//               },
//               child: Icon(Icons.add),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
