import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_project/utilities/note_stream.dart';

class AllFiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:24.0,right: 20,left: 20,bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: NoteStream()),
        ],
      ),
    );
  }
}
