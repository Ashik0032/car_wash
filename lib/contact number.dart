import 'package:car_wash/color_page.dart';
import 'package:car_wash/login.dart';
import 'package:car_wash/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main.dart';

class contact_number extends StatefulWidget {
  const contact_number({super.key});

  @override
  State<contact_number> createState() => _contact_numberState();
}

class _contact_numberState extends State<contact_number> {
  TextEditingController number_controller = TextEditingController();
  final numbervallidation = RegExp(r'[0-9]{10}');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(width * 0.05),
        child: SingleChildScrollView(
          child: Container(
            height: width * 2.25,
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
                        "Welcome",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: width * 0.08,
                          color: colorPage.primaryColor,
                        ),
                      ),
                    ),
                    Text(
                      "Please enter your contact number\nwe will send a OTP",
                      textAlign: TextAlign.center,
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
                      controller: number_controller,
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      textInputAction: TextInputAction.done,
                      maxLength: 10,
                      style: TextStyle(
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.w600,
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (!numbervallidation.hasMatch(value!)) {
                          return "enter valid number";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          labelText: "Contact number",
                          labelStyle: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.w400,
                              color: colorPage.fortColor),
                          hintText: "pleace enter your number",
                          hintStyle: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.w600,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(width * 0.025),
                              borderSide: BorderSide(
                                color: colorPage.primaryColor,
                              )),
                          // focusedBorder: OutlineInputBorder(
                          //     borderRadius:
                          //         BorderRadius.circular(width * 0.025),
                          //     borderSide: BorderSide(
                          //       color: colorPage.primaryColor,
                          //     ))
                      ),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => otp(),
                              ));
                        },
                        child: Container(
                          height: width * 0.13,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                              color: colorPage.primaryColor,
                              borderRadius: BorderRadius.circular(width * 1)),
                          child: Center(
                            child: Text("Continue",
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
                              context,
                              MaterialPageRoute(
                                builder: (context) => login(),
                              ));
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Already have an accound?",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: colorPage.fortColor),
                            children: [
                              TextSpan(
                                  text: "Sign in",
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
