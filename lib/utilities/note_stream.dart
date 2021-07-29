import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_project/utilities/constant.dart';

import 'notes_model.dart';

class NoteStream extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('notes')
          .orderBy('date', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        // if (!snapshot.hasData) {
        //   return Text('there s no data');
        // }
        // List<NoteModel> ListModel = [];
        // final notes = snapshot.data.docs;
        // for (var note in notes) {
        //   final messageTitle = note.get('title');
        //   final messageNote = note.get('note');
        //   final messageList = note.get('lista');
        //   final messageDate = note.get('date');
        //   ListModel.add(NoteModel(
        //       title: messageTitle,
        //       note: messageNote,
        //       date: messageDate,
        //       list: messageList));
        // }
        // return GridView.builder(
        //   itemCount: ListModel.length,
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
        //   itemBuilder: (BuildContext context, int index) {
        //     return NoteBubble(
        //       index: index,
        //       noteModel: ListModel[index],
        //     );
        //   },
        // );

        if(!snapshot.hasData){
          return Text('There s no data implemented yet');
        }
        List<NoteModel> ListModel = [];
        final notes = snapshot.data.docs;
        for(var note in notes){
          final messageText = note.get('title');
          final messageNote = note.get('note');
          final messageList = note.get('lista');
          final messageDate = note.get('date');

          ListModel.add(NoteModel(title: messageText,note: messageNote,list: messageList,date: messageDate));
        }
        return GridView.builder(
          itemCount: ListModel.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
          itemBuilder: (BuildContext context,int index){
            return NoteBubble(index: index,noteModel: ListModel[index],);
          },
        );
      },
    );
  }
}

class NoteBubble extends StatelessWidget {
  final int index;
  final NoteModel noteModel;

  NoteBubble({this.index, this.noteModel});

  titleText() {
    int stringNumber = noteModel.list[1]['title'].length;
    if (stringNumber >= 9) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 2.0, bottom: 2, left: 5, right: 5),
                child: Text(
                  noteModel.list[1]['title'],
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: kStyleContainerText,
                ),
              )),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 2.0, bottom: 2, left: 5, right: 5),
              child: Text(
                noteModel.list[1]['title'],
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: kStyleContainerText,
              ),
            )),
      );
    }
  }

  numberCount() {
    int s = 1;
    int t = noteModel.list.length;
    int x = 3;
    for (int i = 1; t >= 3 && x <= t; i++) {
      x++;
      s = i;
    }
    return '+$s';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 14.0, left: 12, right: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.MMMd().format(noteModel.date.toDate()),
              style: TextStyle(color: appBarContainerFontColor,fontSize: 12),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              noteModel.title ?? 'Sin titulo',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: appBarContainerFontColor),
            ),
            Container(
                height: 36,
                child: Row(
                  children: [
                    noteModel.list.length >= 3
                        ? Expanded(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2.0, vertical: 8),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[350],
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0,
                                            bottom: 2,
                                            left: 5,
                                            right: 5),
                                        child: Text(
                                          noteModel.list[0]['title'],
                                          style: kStyleContainerText,
                                        ),
                                      )),
                                ),
                                titleText(),
                                Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[350],
                                        borderRadius:
                                        BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
                                      child: Text(
                                  numberCount(),
                                  style: kStyleContainerText,
                                ),
                                    ))
                              ],
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: noteModel.list.length >= 3
                                  ? 2
                                  : noteModel.list.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return listFirebase(
                                    index: index,
                                    list: noteModel.list[index]['title']);
                              },
                            ),
                          ),
                  ],
                )),
            Text(noteModel.note ?? 'Sin nota')
          ],
        ),
      ),
    );
  }
}

class listFirebase extends StatelessWidget {
  final int index;
  final String list;

  listFirebase({this.list, this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[350], borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 2.0, bottom: 2, left: 5, right: 5),
            child: Text(
              list ?? '',
              style: kStyleContainerText,
            ),
          )),
    );
  }
}
