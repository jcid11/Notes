import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:note_project/model/user_model.dart';

class UserService{
  final _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth auth = FirebaseAuth.instance;

  // Future createUserOnFirebase({String name,String email,String password})async{
  //   if(checkIfUserIsLogged()){
  //     await _firestore.collection('user').doc(auth.currentUser.uid).set({
  //       'name':name,
  //       'email':email,
  //       'password':password,
  //     });
  //   }
  // }

  Future createUserOnFirebase({String name, String email,String password})async{
    if(checkIfUserIsLogged()){
      await _firestore.collection('user').doc(auth.currentUser.uid).set({
        'name': name,
        'email': email,
        'password': password
      });
    }
  }

  // Future<UserModel> getUserInfo()async{
  //   DocumentSnapshot documentSnapshot=await _firestore.collection('user').doc(getUserUid()).get();
  //   if(documentSnapshot.data()!=null){
  //     return new UserModel(name: documentSnapshot.get('name'));
  //   }
  // }

  Future <UserModel> getUserInfo()async{
    DocumentSnapshot documentSnapshot = await _firestore.collection('user').doc(getUserUid()).get();
    if(documentSnapshot.data()!=null){
      return UserModel(name: documentSnapshot.get('name'));
    }
  }

  // static String getUserUid(){
  //   if(checkIfUserIsLogged()){
  //     return auth.currentUser.uid;
  //   }
  //   return '';
  // }

  static String getUserUid(){
    if(checkIfUserIsLogged()){
      return auth.currentUser.uid;
    }
    return '';
  }
  static Future logout()async{
     await  auth.signOut();
  }
  // static bool checkIfUserIsLogged(){
  //  return auth.currentUser!=null;
  // }
  static bool checkIfUserIsLogged(){
    return auth.currentUser!=null;
  }

}