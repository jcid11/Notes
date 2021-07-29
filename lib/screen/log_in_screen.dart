import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_project/screen/home.dart';
import 'package:note_project/screen/registration_screen.dart';
import 'package:note_project/utilities/constant.dart';

class LogInScreen extends StatefulWidget {
  static const id = 'login_screen';

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  @override
  void initState() {
    super.initState();
  }

  void currentUser() async{
    final user = await _auth.currentUser;
    if(user!=null){
      final loggedInUser = user;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                left: BorderSide(
                  color: Colors.blueGrey,
                  width: 20,
                ),
                right: BorderSide(color: Colors.blueGrey, width: 20),
                bottom: BorderSide(color: Colors.blueGrey, width: 20),
              )),
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
                                padding: const EdgeInsets.only(
                                    top: 65.0, bottom: 15),
                                child: Text(
                                  'Only the best of you',
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
                      height: 45,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 26.0, vertical: 10),
                      child: TextField(
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: kEnterDecoration,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 26.0, vertical: 10),
                      child: TextField(
                        obscureText: true,
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: kEnterDecoration.copyWith(
                            hintText: 'Enter your password'),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Material(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(30.0),
                            elevation: 5.0,
                            child: MaterialButton(
                              onPressed: () async {
                                try {
                                  final user =
                                      await _auth.signInWithEmailAndPassword(
                                          email: email, password: password);
                                  if (user != null) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  }
                                } catch (e) {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) => AlertDialog(
                                      title: Text('Caution'),
                                      content: const Text('The email/password you are using at moment is incorrect, please make sure you are using the right one or proceed to register'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancel'),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                              minWidth: 100.0,
                              height: 42.0,
                              child: Text(
                                'Log in',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Material(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(30.0),
                            elevation: 5.0,
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegistrationScreen()));
                              },
                              minWidth: 100.0,
                              height: 42.0,
                              child: Text(
                                'Register',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
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
