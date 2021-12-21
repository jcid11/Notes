import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_project/tag_function.dart';
import 'package:note_project/utilities/constant.dart';

class NewToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: iconAppColor,
        title: Row(
          children: <Widget>[Expanded(child: SizedBox()), Icon(Icons.check)],
        ),
      ),
      body: newTodoListBody(),
    );
  }
}

class newTodoListBody extends StatefulWidget {
  @override
  _newTodoListBody createState() => _newTodoListBody();
}
class ListElement{
  final Widget widget;
  final int index;
  bool selected;

  ListElement({this.widget, this.index,this.selected=false});
}
class _newTodoListBody extends State<newTodoListBody> {
  List<dynamic> dynamicList = [];

  @override
  void initState() {
    super.initState();
    listElement.add(new ListElement(widget:listElementWidget(),index:index));
  }

  var titleConttroller = TextEditingController();
  bool checkoption = false;
  IconData iconoption = Icons.check_box_outlined;
  bool test = true;
  List<Padding> listElementArray = [];
  List<ListElement> listElement= [];
  int index=0;
  checkMetod() {
    if (checkoption == true) {
      iconoption = Icons.check_box_outline_blank;
      return iconoption;
    } else {
      iconoption = Icons.check_box_outlined;
      return iconoption;
    }
  }



  Widget listElementWidget(){
   return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 2),
      child: Row(
        children: [
          IconButton(
              icon: Icon(
                checkMetod(),
                color: Colors.blueGrey,
              ),
              onPressed: () {
                setState(() {
                  checkoption = !checkoption;
                });
              }),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 2.0, right: 28),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'List element'),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }

  List<Padding> addtoList() {
    Padding testVariable = Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 2),
      child: Row(
        children: [
          IconButton(
              icon: Icon(
                checkMetod(),
                color: Colors.blueGrey,
              ),
              onPressed: () {
                setState(() {
                  checkoption = !checkoption;
                });
              }),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 2.0, right: 28),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'List element'),
                    ),
                  )),
            ),
          )
        ],
      ),
    );

    listElementArray.add(testVariable);
  }

  listLast(List value){
    return value.last;
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextFormField(
              controller: titleConttroller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: 'title'),
            ),
          ),
          // tagWidget(),

          Expanded(
            child: ListView.builder(
              itemCount: listElement.length,
              itemBuilder: (BuildContext context, int index) {
                return BuildListElement(onPressed: (){
                  setState(() {
                    listElement[index].selected = !listElement[index].selected;
                  });
                },listElement:listElement[index],);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 52.0, top: 20, right: 30),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  listElement.add(new ListElement(index:index,selected: false));
                 addtoList();
                });
              },
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}
class BuildListElement extends StatelessWidget {
  final ListElement listElement;
  final Function onPressed;

  BuildListElement({this.listElement,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 2),
      child: Row(
        children: [
          IconButton(
              icon: Icon(
                !listElement.selected?Icons.check_box_outline_blank:Icons.check_box_outlined,
                color: Colors.blueGrey,
              ),
              onPressed:onPressed),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 2.0, right: 28),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'List element'),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
