import 'package:car_wash/bottom_bar.dart';
import 'package:car_wash/home.dart';
import 'package:car_wash/login.dart';
import 'package:car_wash/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';
// String? userimages;
class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  setdata() async {
    SharedPreferences _prefs =await SharedPreferences.getInstance();
    _prefs.setBool("login",true);
    _prefs.setString("name", currentUserName.toString());
    _prefs.setString("id", currentUserid.toString());
  }

  getCurrentUser() async {
    return await auth.currentUser;
  }

  signInWithGoogle(BuildContext context) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();

    final GoogleSignInAuthentication? googleSignInAuthentication =
    await googleSignInAccount?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication?.idToken,
        accessToken: googleSignInAuthentication?.accessToken);

    UserCredential result = await firebaseAuth.signInWithCredential(credential);
    User? userDetails = result.user;
    currentUserName=userDetails!.displayName;
    currentUserEmail=userDetails!.email;
    currentUserimage=userDetails!.photoURL;

    var userlist= await FirebaseFirestore.instance.collection("carwash").where("email",isEqualTo:currentUserEmail).get();

    if(userlist.docs.isEmpty){
      Navigator.push(context, CupertinoPageRoute(builder: (context) => signup(sign: true,),));
    }else{
      currentUserid=userlist.docs[0].id;

      setdata();

      Navigator.push(context, CupertinoPageRoute(builder: (context) => bottom_bar(),));

    }

  }
}










