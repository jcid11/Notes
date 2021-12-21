import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:note_project/screen/home.dart';
import 'package:note_project/screen/log_in_screen.dart';
import 'package:note_project/screen/registration_screen.dart';
import 'package:note_project/services/user_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDefault();
  runApp(MyApp());

}

Future<void> initializeDefault() async {
  FirebaseApp app = await Firebase.initializeApp();
  assert(app != null);
  print('Initialized default app $app');
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Notes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blueGrey,
      ),
      initialRoute: UserService.checkIfUserIsLogged() ? HomePage.id: LogInScreen.id,
      routes: {
        LogInScreen.id : (context) => LogInScreen(),
        RegistrationScreen.id : (context) => RegistrationScreen(),
        HomePage.id : (context) => HomePage()
      },
    );
  }
}


