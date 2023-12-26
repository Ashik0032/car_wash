import 'package:car_wash/color_page.dart';
import 'package:car_wash/google_sign_in.dart';
import 'package:car_wash/image_page.dart';
import 'package:car_wash/location.dart';
import 'package:car_wash/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'contact number.dart';
import 'main.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool tap = true;
  TextEditingController password_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  final emailvallidation =
  RegExp(r"^[a-z0-9.a-z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-z0-9]+\.[a-z]+");

  final passwordvallidation =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  bool tik = false;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(width * 0.05),
        child: SingleChildScrollView(
          child: Container(
            height: width * 2.25,
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: width * 0.02,
                  ),
                  Column(
                    children: [
                      Center(
                        child: Text(
                          "Welcome back",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: width * 0.08,
                            color: colorPage.primaryColor,
                          ),
                        ),
                      ),
                      Text(
                        "Please login into your account",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.055,
                          color: colorPage.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TextFormField(
                        controller: email_controller,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.w600,
                            color: colorPage.primaryColor),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // validator: (value) {
                        //   if (!emailvallidation.hasMatch(value!)) {
                        //     return "enter valid email";
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        decoration: InputDecoration(
                          labelText: "email",
                          labelStyle: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.w400,
                              color: colorPage.fortColor),
                          hintText: "pleace enter your email",
                          hintStyle: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.w600,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(width * 0.025),
                              borderSide: BorderSide(
                                color: colorPage.primaryColor,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(width * 0.025),
                              borderSide: BorderSide(
                                color: colorPage.primaryColor,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: width * 0.08,
                      ),
                      TextFormField(
                        controller: password_controller,
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.done,
                        obscureText: tap ? true : false,
                        maxLength: 8,
                        style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w600,
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (!passwordvallidation.hasMatch(value!)) {
                            return "enter valid password";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                                onTap: () {
                                  tap = !tap;
                                  setState(() {});
                                },
                                child: Icon(tap
                                    ? Icons.visibility_off
                                    : Icons.visibility)),
                            labelText: "Password",
                            labelStyle: TextStyle(
                                fontSize: width * 0.05,
                                color: colorPage.primaryColor,
                                fontWeight: FontWeight.w400),
                            hintText: "pleace enter your password",
                            hintStyle: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.w600,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(width * 0.025),
                                borderSide: BorderSide(
                                  color: colorPage.primaryColor,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(width * 0.025),
                                borderSide: BorderSide(
                                  color: colorPage.primaryColor,
                                ))),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                activeColor: colorPage.primaryColor,
                                value: tik,
                                onChanged: (value) {
                                  setState(() {
                                    tik = value!;
                                  });
                                },
                              ),
                              Text(
                                "Remember me",
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          Text("Forget password?")
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: width * 0.5,
                    width: width * 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            if (email_controller.text == "") {

                              email_controller.text == ""
                                  ? ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                      Text("please enter your email!")))
                                  : password_controller.text == ""
                                  ? ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                  content: Text(
                                      "please enter your password!")))
                                  : ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                  content: Text(
                                      "pleace enter your valid details")));

                            } else {

                              FirebaseAuth.instance.signInWithEmailAndPassword(email: email_controller.text, password: password_controller.text).then((value) async {
                                var data=await FirebaseFirestore.instance.collection("carwash").where("email",isEqualTo: email_controller.text).get();

                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => location(),
                                  )).catchError((Error){
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Center(
                                            child:
                                            Text(Error.code.toString()))));
                              });
                            }

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
                        GestureDetector(
                          onTap: () {
                            AuthMethods().signInWithGoogle(context);
                          },
                          child: Container(
                            height: width * 0.13,
                            width: width * 0.6,
                            decoration: BoxDecoration(
                              // color: colorPage.secondaryColor,
                                border: Border.all(
                                    color: colorPage.primaryColor,
                                    width: width * 0.007),
                                borderRadius: BorderRadius.circular(width * 1)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width * 0.025,
                                ),
                                SvgPicture.asset(imagePage.google),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                Text(" Sign in with Google",
                                    style: GoogleFonts.montserrat(
                                        color: colorPage.primaryColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: width * 0.04)),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => signup(),
                                ));
                          },
                          child: RichText(
                            text: TextSpan(
                              text: "Don’t have an account?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: colorPage.fortColor),
                              children: [
                                TextSpan(
                                    text: "Sign up",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: colorPage.primaryColor)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
