
import 'package:flutter/material.dart';

const kAppBackgroungColor = Colors.white;
const kAppHeight= 80.0;
const kTabsNumber = 2;
const appBarTextColor = Colors.blueGrey;
final appBarContainerFontColor = Colors.blueGrey[700];
const kStyleContainerText = TextStyle(
    color: Colors.blueGrey, fontSize: 13,fontWeight: FontWeight.w500);
const appBarTab = TabBar(
  labelPadding: EdgeInsets.only(right: 50, left: 55),
  labelColor: appBarTextColor,
  indicatorColor: appBarTextColor,
  isScrollable: false,
  tabs: [
    Tab(
      text: "All Files",
    ),
    // SizedBox(
    //   width: 10,
    // ),
    Tab(
      text: 'Folders',
    ),
  ],
);
const mainColor = Colors.blueGrey;
const iconAppColor = IconThemeData(
  color: mainColor,
);
const kEnterDecoration = InputDecoration(
  hintText: 'Enter your email',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);