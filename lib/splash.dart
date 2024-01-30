import 'package:car_wash/bottom_bar.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/home.dart';
import 'package:car_wash/image_page.dart';
import 'package:car_wash/login.dart';
import 'package:car_wash/login_signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  bool login1=false;
  getData()
  async {
    SharedPreferences _prefs= await SharedPreferences.getInstance();

    login1=_prefs.getBool("login")??false;
    currentUserid=_prefs.getString("id")??"";
    currentUserName=_prefs.getString("name")??"";

    Future.delayed(Duration(seconds: 3)).then((value) =>
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>login1?bottom_bar():login_Signup())));
  }
  @override
  void initState() {
    getData();
    // TODO: implement initState

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: width * 2.25,
        width: width * 1,
        // color: colorPage.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: width * 0.5,
                width: width * 0.6,
                child: Image.asset(
                  imagePage.logo,
                )),
            Text("QuickWash",
                style: GoogleFonts.muktaVaani(
                    color: colorPage.primaryColor,
                    fontSize: width * 0.12,
                    fontWeight: FontWeight.w800))
          ],
        ),
      ),
    );
  }
}
