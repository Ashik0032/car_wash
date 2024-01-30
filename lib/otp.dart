import 'package:car_wash/color_page.dart';
import 'package:car_wash/login.dart';
import 'package:car_wash/on_site.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'main.dart';

class otp extends StatefulWidget {
  const otp({super.key});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(width * 0.05),
        child: SingleChildScrollView(
          child: Container(
            height: width * 2.25,
            width: width * 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // SizedBox(height: width*0.0,),
                Container(
                  height: width * 0.65,
                  width: width * 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Welcome",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: width * 0.08,
                          color: colorPage.primaryColor,
                        ),
                      ),
                      Text(
                        "Please enter your OTP",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.055,
                          color: colorPage.primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: width * 0.06,
                      ),
                      Pinput(
                        defaultPinTheme: PinTheme(
                            height: width * 0.13,
                            width: width * 0.13,
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: width * 0.08,
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(width * 0.02),
                                border:
                                    Border.all(color: colorPage.primaryColor))),
                      ),
                      // SizedBox(height: width*0.05,),
                      Text("Resend OTP",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: colorPage.primaryColor,
                              fontSize: width * 0.045,
                              decoration: TextDecoration.underline))
                    ],
                  ),
                ),

                Container(
                  height: width * 0.5,
                  width: width * 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => onSite(),
                              ));
                        },
                        child: Container(
                          height: width * 0.13,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                              color: colorPage.primaryColor,
                              borderRadius: BorderRadius.circular(width * 1)),
                          child: Center(
                            child: Text("Sign in",
                                style: TextStyle(
                                    color: colorPage.secondaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: width * 0.05)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(
                              context);
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Already have an accound?",
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
    );
  }
}
