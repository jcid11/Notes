import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_project/screen/home.dart';
import 'package:note_project/services/user_service.dart';
import 'package:note_project/utilities/constant.dart';


class RegistrationScreen extends StatelessWidget {
  static const id = 'registration_screen';
  final _auth = FirebaseAuth.instance;
  String name;
  String email;
  String password;
  String password2;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 65.0, bottom: 15),
                                child: Text(
                                  'Welcome',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic),
                                ),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Icon(
                      Icons.menu_book,
                      size: 150,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    registrationField(hintText: 'Enter your name',onChanged: (value){name = value;},obscureText: false,),
                    registrationField(hintText: 'Enter your email',onChanged: (value){email=value;},obscureText: false,),
                    registrationField(hintText: 'Enter your password',onChanged: (value){password=value;},obscureText: true,),
                    registrationField(hintText: 'Re-enter your password',onChanged: (value){password2 = value;},obscureText: true,),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Material(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(30.0),
                        elevation: 5.0,
                        child: MaterialButton(
                          onPressed: () async{
                                try{
                                  final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                                  var user = newUser.user;
                                  if(newUser!=null){
                                    UserService userService=new UserService();
                                    await userService.createUserOnFirebase(email:email,password: password,name:  name);
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                                    }
                                      }
                                catch (e) {
                                print (e);
                                }},
                          minWidth: 200.0,
                          height: 42.0,
                          child: Text(
                            'Register',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class registrationField extends StatelessWidget {
  String hintText;
 TextEditingController controller;
 Function onChanged;
  bool obscureText=false;
  registrationField({this.hintText,this.controller,this.onChanged,this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 10),
      child: TextField(
        obscureText: obscureText,
        onChanged: onChanged,
        controller: controller,
        decoration: kEnterDecoration.copyWith(hintText: hintText),
      ),
    );
  }
}
