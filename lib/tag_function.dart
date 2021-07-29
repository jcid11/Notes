// import 'package:flutter/cupertino.dart';
// import 'package:flutter_tags/flutter_tags.dart';
//
// class tagWidget extends StatefulWidget {
//
//   const tagWidget({Key key}) : super(key: key);
//
//   @override
//   _tagWidgetState createState() => _tagWidgetState();
// }
//
// class _tagWidgetState extends State<tagWidget> {
//   List<String> testing = [];
//   final GlobalKey<TagsState> _globalKey = GlobalKey<TagsState>();
//   List tags = new List();
//
//   @override
//   Widget build(BuildContext context) {
//     return Tags(
//       key: _globalKey,
//       itemCount: tags.length,
//       textDirection: TextDirection.rtl,
//       verticalDirection: VerticalDirection.up,
//       horizontalScroll: true,
//       textField: TagsTextField(
//         textStyle: TextStyle(fontSize: 14),
//         onSubmitted: (string){
//           setState(() {
//             tags.add(ItemClass(title: string));
//             print(tags);
//           });
//         }
//       ),
//       itemBuilder: (index){
//         final ItemClass currentItem = tags[index];
//         return ItemTags(
//           pressEnabled: false,
//           alignment: MainAxisAlignment.end,
//           index: index,
//           title: currentItem.title,
//           textStyle: TextStyle(fontSize: 14),
//           combine: ItemTagsCombine.withTextBefore,
//           onPressed: (i)=>print(i),
//           onLongPressed: (i)=>print(i),
//           removeButton: ItemTagsRemoveButton(
//             onRemoved: (){
//               setState(() {
//                 tags.removeAt(index);
//               });
//               return true;
//             }
//           ),
//         );
//       },
//     );
//   }
// }
