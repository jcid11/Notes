import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const containerIconColor = Color(0xFF546E7A);
const containerIconSize = 40.0;
const paddingBottomContainer = EdgeInsets.only(bottom:15.0);

class myNotesContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: paddingBottomContainer,
            child: Icon(
              FontAwesomeIcons.fileAlt,
              size: containerIconSize,
              color: containerIconColor,
            ),
          ),
          Text(
            'My Notes',
            style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
          )
        ],
      ),
    );
  }
}

class todoListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: paddingBottomContainer,
            child: Icon(
              FontAwesomeIcons.checkDouble,
              size: containerIconSize,
              color: containerIconColor,
            ),
          ),

          Text(
            'To-do List',
            style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
          )
        ],
      ),
    );
  }
}

class journalContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: paddingBottomContainer,
            child: Icon(
              FontAwesomeIcons.edit,
              size: containerIconSize,
              color: containerIconColor,
            ),
          ),
          Text(
            'Journal',
            style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
          )
        ],
      ),
    );
  }
}

class normalListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: paddingBottomContainer,
            child: Icon(
              FontAwesomeIcons.listUl,
              size: containerIconSize,
              color: containerIconColor,
            ),
          ),
          Text(
            'My List',
            style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
          )
        ],
      ),
    );
  }
}

class otherContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: paddingBottomContainer,
            child: Icon(
              FontAwesomeIcons.plus,
              size: containerIconSize,
              color: containerIconColor,
            ),
          ),
          Text(
            'Other',
            style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
          )
        ],
      ),
    );
  }
}


