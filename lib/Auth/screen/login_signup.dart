import 'package:car_wash/color_page.dart';
import 'package:car_wash/home/screens/home.dart';
import 'package:car_wash/image_page.dart';
import 'package:car_wash/Auth/screen/login.dart';
import 'package:car_wash/Auth/screen/signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

class login_Signup extends StatefulWidget {
  const login_Signup({super.key});

  @override
  State<login_Signup> createState() => _login_SignupState();
}

class _login_SignupState extends State<login_Signup> {
//  bool login1 =false;

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: width * 0.25),
            Container(
              height: width * 0.5,
              width: width * 1,
              child: Image.asset(imagePage.car),
            ),
            Text("Here’s where\nwe shine",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: width * 0.08,
                    color: colorPage.primaryColor)),
            Text(
              "Book your easy\nbe the shiny rock star on the road",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: width * 0.055,
                color: colorPage.primaryColor,
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => login(email: "", password: ""),));
                  },
                  child: Container(
                    height: width * 0.13,
                    width: width * 0.4,
                    decoration: BoxDecoration(
                        color: colorPage.primaryColor,
                        borderRadius: BorderRadius.circular(width * 1)),
                    child: Center(
                      child: Text("Login",
                          style: TextStyle(
                              color: colorPage.secondaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: width * 0.05)),
                    ),
                  ),
                ),
                Text("or"),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => signup(sign: false,),
                        ));
                  },
                  child: Container(
                    height: width * 0.13,
                    width: width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 1),
                      border: Border.all(color: colorPage.primaryColor),
                    ),
                    child: Center(
                        child: Text(
                      "Sign up",
                      style: TextStyle(
                          color: colorPage.thirdColor,
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.05),
                    )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
