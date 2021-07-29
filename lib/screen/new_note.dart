import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:note_project/tag_function.dart';
import 'package:note_project/utilities/constant.dart';
import 'package:note_project/utilities/notes_model.dart';

final _firestore = FirebaseFirestore.instance;

class NewNote extends StatefulWidget {
  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  DateTime date = DateTime.now();
  String title;
  String note;
  String category = 'Note';
  final GlobalKey<TagsState> _globalKey = GlobalKey<TagsState>();
  List<Item> tags = [];
  List<NoteModel> noteList=[];

  final _auth = FirebaseAuth.instance;

  void getCurrentUser() async {
    final user = await _auth.currentUser;
    if (user != null) {
      final loggedInUser = user;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: iconAppColor,
        title: Row(
          children: <Widget>[
            Expanded(child: SizedBox()),
            MaterialButton(
              onPressed: ()async{
                var map = new Map<String, dynamic>();
                map['title']=title;
                map["lista"] =  noteList.map((e) => e.toMap2()).toList();
                map['note']=note;
                map['date']=date;
                map['category']= category;
                await _firestore.collection('notes').add(map);
                Navigator.pop(context);
              },
                child: Icon(Icons.check))
          ],
        ),
      ),
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextFormField(
                style: TextStyle(fontWeight: FontWeight.bold),
                onChanged: (value) {
                  title = value;
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'title'),
              ),
            ),
            Tags(
              key: _globalKey,
              itemCount: tags.length,
              textDirection: TextDirection.rtl,
              verticalDirection: VerticalDirection.up,
              horizontalScroll: true,
              textField: TagsTextField(
                  textStyle: TextStyle(fontSize: 14),
                  onSubmitted: (string){
                    setState(() {
                      tags.add(Item(title: string));
                      noteList.add(NoteModel(title: string));
                    });
                  }
              ),
              itemBuilder: (index){
                final Item currentItem = tags[index];
                return ItemTags(
                  pressEnabled: false,
                  alignment: MainAxisAlignment.end,
                  index: index,
                  title: currentItem.title,
                  textStyle: TextStyle(fontSize: 14),
                  combine: ItemTagsCombine.withTextBefore,
                  onPressed: (i)=>print(i),
                  onLongPressed: (i)=>print(i),
                  removeButton: ItemTagsRemoveButton(
                      onRemoved: (){
                        setState(() {
                          tags.removeAt(index);
                          noteList.removeAt(index);
                        });
                        return true;
                      }
                  ),
                );
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                    child: TextField(
                      onChanged: (value) {
                        note = value;
                      },
                      cursorHeight: 25,
                      maxLines: null,
                      showCursor: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'Note body'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class newNoteBody extends StatelessWidget {
//
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
//               onChanged: (value) {
//                 title = value;
//               },
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
//                     border: Border.all(color: Colors.blueGrey, width: 3),
//                     borderRadius: BorderRadius.all(Radius.circular(20))),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
//                   child: TextField(
//                     onChanged: (value) {
//                       note = value;
//                     },
//                     cursorHeight: 25,
//                     maxLines: null,
//                     showCursor: true,
//                     decoration: InputDecoration(
//                         border: InputBorder.none,
//                         focusedBorder: InputBorder.none,
//                         enabledBorder: InputBorder.none,
//                         errorBorder: InputBorder.none,
//                         disabledBorder: InputBorder.none,
//                         hintText: 'Note body'),
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
