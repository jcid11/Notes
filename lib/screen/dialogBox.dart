import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_project/screen/new_note.dart';

import 'new_todo_list.dart';

class dialogBox extends StatelessWidget {
  bool update= false;
  double typeElementSize = 5;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('What kind of note you would like to create:'),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              rawMaterialTypeOfNote(title: 'Note',page: NewNote(update: update,),context: context),
              SizedBox(height: typeElementSize,),
              rawMaterialTypeOfNote(title: 'ToDo List',page: NewToDoList(),context: context),
              SizedBox(height: typeElementSize,),
              rawMaterialTypeOfNote(title: 'Journal',page: NewNote(update: update,),context: context),
              SizedBox(height: typeElementSize,),
              rawMaterialTypeOfNote(title: 'Check List',page: NewNote(update: update,),context: context)
            ],
          ),
        ),
      ],
    );
  }
}

Widget rawMaterialTypeOfNote({String title, BuildContext context, Widget page}){
  return RawMaterialButton(
    onPressed: (){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => page));
    },
    child: Container(
        width: 250,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey,width: 1),
            borderRadius: BorderRadius.circular(130)
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.blueGrey,fontSize: 32),
          ),
        )),
  );
}
