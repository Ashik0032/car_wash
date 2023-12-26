import 'package:car_wash/Confirmation.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'Take_a_slot-1.dart';
import 'main.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  TextEditingController name_controller = TextEditingController();
  TextEditingController number_controller = TextEditingController();
  TextEditingController number_controller1 = TextEditingController();
  TextEditingController number_controller2 = TextEditingController();
  TextEditingController number_controller3 = TextEditingController();
  GestureFlipCardController flipCardController=GestureFlipCardController();
  final passwordvallidation =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  final numbervallidation = RegExp(r'[0-9]{10}');
  final formkey = GlobalKey<FormState>();
  bool tik = false;
  bool on=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorPage.nineColor,
        appBar: AppBar(
          backgroundColor: colorPage.nineColor,
          centerTitle: true,
          leading: Padding(
            padding: EdgeInsets.all(width * 0.043),
            child: InkWell(
              onTap: () {
                Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => confirmation(),
                    ));
              },
              child: Container(
                height: width * 0.03,
                width: width * 0.03,
                child: SvgPicture.asset(
                  imagePage.arrow,
                ),
              ),
            ),
          ),
          title: Text(
            "Payment",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: width * 0.08,
              color: colorPage.primaryColor,
            ),
          ),
          elevation: 0,
        ),
        body: Padding(
            padding: EdgeInsets.only(
                top: width * 0.05, left: width * 0.05, right: width * 0.05),
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Container(
                  height: width * 2.33,
                  width: width * 1,
                   // color: Colors.red,
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: width*0.03,),
                        GestureFlipCard(
                        animationDuration: Duration(milliseconds: 300),
                        axis: FlipAxis.vertical,

                        controller:flipCardController,
                        enableController: true,
                        frontWidget: Center(
                          child: Container(
                            height: width*0.55,
                            width: width*1,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  colorPage.a26,
                                  colorPage.a27,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(width*0.04),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: width*0.13,
                                      width: width*0.4,
                                      // color: Colors.green,
                                      child: Image.asset(imagePage.rupay,),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(right: width*0.15,left: width*0.08),
                                  child: Container(
                                    height: width*0.3,
                                    width: width*1,
                                    // color: Colors.green,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Card Number",
                                                style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: width*0.035,
                                                      color: colorPage.a28
                                                  ),
                                                )
                                            ),
                                            SizedBox(height: width*0.015,),
                                            number_controller1.text==""?Text("XXXXXXXXXXXXXXX",
                                            style: TextStyle(
                                              fontSize: width*0.05
                                            ),):Text(number_controller1.text,
                                                style: GoogleFonts.poppins(
                                                    textStyle:TextStyle(
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: width*0.045,
                                                        color: colorPage.a30

                                                    )

                                                )
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("Cardholder name",
                                                    style: GoogleFonts.montserrat(
                                                      textStyle: TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: width*0.035,
                                                          color: colorPage.a28
                                                      ),
                                                    )
                                                ),
                                                SizedBox(width: width*0.23,),
                                                Text("Exp",
                                                    style: GoogleFonts.montserrat(
                                                      textStyle: TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: width*0.035,
                                                          color: colorPage.a28
                                                      ),
                                                    )
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: width*0.015,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text( name_controller.text,
                                                    style: GoogleFonts.poppins(
                                                      textStyle:TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: width*0.045,
                                                          color: colorPage.a30
                                                      ),
                                                    )
                                                ),
                                                Text("18/30",
                                                    style: GoogleFonts.poppins(
                                                      textStyle:TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: width*0.045,
                                                          color: colorPage.a30
                                                      ),

                                                    )
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ),
                        ),
                         backWidget: Container(
                           height: width*0.55,
                           width: width*1,
                           decoration: BoxDecoration(
                             gradient: LinearGradient(
                               colors: [
                                 colorPage.a26,
                                 colorPage.a27,
                               ],
                             ),
                             borderRadius: BorderRadius.circular(width*0.04),
                           ),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               SizedBox(height: width*0.04,),
                               Container(
                                 height: width*0.15,
                                 width: width*1,
                                 color: colorPage.thirdColor,
                               ),
                               SizedBox(height: width*0.025),
                               Row(
                                 children: [
                                   Container(
                                     height: width*0.15,
                                     width: width*0.6,
                                     color: colorPage.a18,
                                   ),
                                   Container(
                                     height: width*0.1,
                                     width: width*0.2,
                                     color: colorPage.secondaryColor,
                                     child: Text(number_controller3.text,
                                     style: TextStyle(
                                       fontSize: width*0.07,
                                       fontWeight: FontWeight.w500
                                     )),
                                   ),
                                 ],
                               ),
                             ],
                           ),
                         ),
              ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: width * 0.06, top: width * 0.06,),
                          child:Container(
                            height: width*0.17,
                            child: TextFormField(
                              controller: name_controller,
                              textCapitalization: TextCapitalization.words,
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.done,
                              onChanged: (value) {
                                setState(() {

                                });
                              },
                              style: TextStyle(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.w600,
                              ),
                              decoration: InputDecoration(
                                  labelText: "Cardholder name",
                                  labelStyle: TextStyle(
                                      fontSize: width * 0.06,
                                      color: colorPage.primaryColor,
                                      fontWeight: FontWeight.w400),
                                  hintText: "Enter your name",
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
                          ),
                        ),
                        Container(
                          height: width*0.23,
                          child: TextFormField(
                            controller: number_controller1,
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            maxLength: 16,
                            onChanged: (value) {
                              setState(() {

                              });
                            },

                            // obscureText: true,
                            // obscuringCharacter:"*",
                            style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.w600,
                            ),

                            decoration: InputDecoration(
                                labelText: "Card number",
                                labelStyle: TextStyle(
                                    fontSize: width * 0.06,
                                    fontWeight: FontWeight.w400,
                                    color: colorPage.primaryColor),
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
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: width*0.04),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: width*0.17,
                                width: width*0.4,
                                child: TextFormField(
                                  controller: number_controller2,
                                  textCapitalization: TextCapitalization.words,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,

                                  obscureText: true,
                                  obscuringCharacter:"*",
                                  style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  decoration: InputDecoration(
                                      labelText: "Valid thru",
                                      labelStyle: TextStyle(
                                          fontSize: width * 0.06,
                                          fontWeight: FontWeight.w400,
                                          color: colorPage.primaryColor),
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
                              ),
                              Container(
                                height: width*0.22,
                                width: width*0.4,
                                child: TextFormField(
                                  controller: number_controller3,
                                  textCapitalization: TextCapitalization.words,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  maxLength: 3,
                                  onTap: () {
                                    flipCardController.flipcard();
                                    setState(() {
                                    });
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                    });
                                  },

                                  // obscureText: true,
                                  // obscuringCharacter:"*",
                                  style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  decoration: InputDecoration(
                                      labelText: "CVV",
                                      labelStyle: TextStyle(
                                          fontSize: width * 0.06,
                                          fontWeight: FontWeight.w400,
                                          color: colorPage.primaryColor),
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
                              ),
                            ],
                          ),
                        ),
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
                              "Set as default servicing",
                              style: TextStyle(
                                  color: colorPage.fiftColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: width * 0.052),
                            ),
                          ],
                        ),
                        SizedBox(height: width*0.3,),
                        Center(
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                backgroundColor: colorPage.secondaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(width * 0.05),
                                      topRight: Radius.circular(width * 0.05)),
                                ),
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: width * 0.9,
                                    width: width * 1,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: width * 0.35,
                                            width: width * 0.35,
                                            child: Lottie.asset(imagePage.lottie)),
                                        Text(
                                          "Payment successefull",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w700,
                                              fontSize: width * 0.075,
                                              color: colorPage.primaryColor),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Booking ID",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w300,
                                              color: colorPage.primaryColor,
                                              fontSize: width*0.05

                                            ),),
                                            Text("- #24352",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w700,
                                              color: colorPage.primaryColor,
                                              fontSize: width*0.05

                                            ),),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              height: width * 0.13,
                              width: width * 0.4,
                              decoration: BoxDecoration(
                                  color: colorPage.primaryColor,
                                  borderRadius: BorderRadius.circular(width * 1)),
                              child: Center(
                                child: Text("Confirm",
                                    style: TextStyle(
                                        color: colorPage.secondaryColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: width * 0.05)),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
              ),
            )
        )
    );
  }
}
