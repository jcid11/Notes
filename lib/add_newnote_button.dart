import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_project/screen/log_in_screen.dart';
import 'package:note_project/screen/new_note.dart';
import 'package:note_project/screen/new_todo_list.dart';
import 'package:note_project/screen/registration_screen.dart';

class newNoteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewNote()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10.0, bottom: 1),
                child: Icon(
                  FontAwesomeIcons.plus,
                  color: Colors.white,
                  size: 14,
                ),
              ),
              Text(
                'Add new note',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}