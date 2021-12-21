import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel{
final String title;
final String note;
final List list;
final Timestamp date;
final String id;
NoteModel({this.title,this.note,this.list,this.date,this.id});
  Map<String, dynamic> toMap2() {
    return {
      'title':title
    };
  }
}