import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future registerWithEmail(String email, String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password,);

      User ? user = result.user;

      return user;
    }catch (e){
      print(e.toString());
      return null;
    }
  }
}