

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../Screens/HomePage/Homepage.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _userFromFirebase(User? user){
    return user;
  }

  Stream<User?> get user{
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  Future<dynamic> SignInWithEmailPass(String email, String password) async {
    bool isPass = true;

    try{
      UserCredential uc = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return uc.user;
      //email and password authetication in firebase database
    }
    on FirebaseAuthException catch(e){
      isPass = false;
      print(e.toString());
      if(e.code == 'user-not-found'){
        return e.message ?? 'Email or password not found';
        //RegisterUser();
      }else if(e.code == 'wrong-password'){
        return e.message ?? 'Password is not found';
      }
    }catch(e){
      isPass = false;
      return  e.toString();
    }
    //if(isPass){
    //Navigator.push(context, MaterialPageRoute(builder: (context){
    //return HomePage();
    //}));
  }

  Future<dynamic> registerUserWithEmailPass(String email, String pass) async{
    try{
      UserCredential uc = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: pass

      );
      return uc.user;
      //email and password authetication in firebase database
    } on FirebaseAuthException catch(e){

      if(e.code == 'email-already-in-use'){
        return e.message ?? 'Email already in use';
      }else if(e.code == 'weak-password'){
        return e.message ?? 'Your password is weak';
      }
    }
  }
  Future signOut() async{
    _auth.signOut();

  }
}
