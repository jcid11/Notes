import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_project/utilities/note_stream.dart';

class AllFiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:24.0,right: 20,left: 20,bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: NoteStream()),
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     color: Colors.grey.shade300,
          //   ),
          //   height: 100,
          //   child: Padding(
          //     padding: const EdgeInsets.only(top:14.0,left: 8,right: 8),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text('May 12'),
          //         SizedBox(height: 5,),
          //         Text('Exploration ideas',style: TextStyle(fontWeight: FontWeight.bold),),
          //         Row(
          //           children: [
          //             Text('Design'),
          //             SizedBox(width: 5,),
          //             Text('Productivity'),
          //             Icon(Icons.plus_one)
          //           ],
          //         ),
          //         Text('Yesterday morning')
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
