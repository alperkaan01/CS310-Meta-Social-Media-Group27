

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../Screens/HomePage/Homepage.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
  }
