import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_project/model/user_model.dart';
import 'package:note_project/screen/all_files_screen.dart';
import 'package:note_project/screen/folders_screen.dart';
import 'package:note_project/screen/log_in_screen.dart';
import 'package:note_project/services/user_service.dart';
import 'package:note_project/utilities/constant.dart';
import 'package:note_project/containerlisttypes.dart';
import '../add_newnote_button.dart';
import '../card_content.dart';

class HomePage extends StatelessWidget {
  static const id = 'home_screen';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: kTabsNumber,
      child: Scaffold(
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[newNoteButton()],
          ),
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(140.0),
            child: AppBar(
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.logout,color: Colors.red,), onPressed: () {
                  UserService.logout().then((value){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LogInScreen()));
                  });
              },
              ),
              toolbarHeight: kAppHeight,
              backgroundColor: kAppBackgroungColor,
              title: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: FutureBuilder(
                            future: UserService().getUserInfo(),
                            builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
                              if(!snapshot.hasData){
                                return SizedBox();
                              }
                              return Text('Welcome, ${snapshot.data.name??''}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: appBarTextColor,
                                      fontSize: 20));
                            },
                          )),
                      Icon(
                        Icons.search,
                        color: appBarTextColor,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Icon(
                        Icons.menu,
                        color: appBarTextColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                            BorderSide(color: Colors.grey[300], width: 1))),
                  ),
                ],
              ),
              bottom: appBarTab,
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Container(
                child: AllFiles(),
              ),
              // SizedBox(),
              FoldersScreen(),
            ],
          )),
    );
  }
}
