import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel{
final String title;
final String note;
final List list;
final Timestamp date;
Timestamp date2;
NoteModel({this.title,this.note,this.list,this.date});
  Map<String, dynamic> toMap2() {
    return {
      'title':title
    };
  }
}