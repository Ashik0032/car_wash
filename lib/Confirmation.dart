import 'package:car_wash/Payment.dart';
import 'package:car_wash/Take_a_slot-1.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:car_wash/model/booking_model.dart';
import 'package:car_wash/order_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'bottom_bar.dart';
import 'main.dart';

class confirmation extends StatefulWidget {
  confirmation({super.key,required this.bookingModel});
  // final Map<String, dynamic> slotbooking;
  BookingModel bookingModel;

  @override
  State<confirmation> createState() => _confirmationState();
}

class _confirmationState extends State<confirmation> {
  String tik = "";
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
                Navigator.pop(context);
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
            "Confirmation",
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
            child: Container(
                height: width * 2.33,
                width: width * 1,
                // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: width * 1.03,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Details",
                            style: TextStyle(
                                color: colorPage.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: width * 0.052),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => orderDetails(image: widget.bookingModel.images,
                                      pic_service:  widget.bookingModel.picService,
                                      take_a_date:  widget.bookingModel.takeDate,
                                      pic_slot: '',
                                      payment_method: '',
                                      // vehicle: '', model: '', Regnumber: '', client: '', phoneNumber: '',
                                    ),
                                  ));
                            },
                            child: Container(
                              height: width * 0.31,
                              width: width * 1,
                              decoration: BoxDecoration(
                                  color: colorPage.secondaryColor,
                                  borderRadius:
                                      BorderRadius.circular(width * 0.015)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(width * 0.025),
                                        child: Container(
                                          height: width * 0.25,
                                          width: width * 0.23,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(widget
                                                      .bookingModel.images),
                                                  fit: BoxFit.cover),
                                              // color: Colors.greenAccent,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      width * 0.015)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                              widget
                                                  .bookingModel.picService,
                                              style: TextStyle(
                                                // fontSize:14.36,
                                                fontSize: width * 0.055,
                                                fontWeight: FontWeight.w700,
                                                color: colorPage.primaryColor,
                                              )),
                                          Text(currentUserName.toString(),
                                              style: TextStyle(
                                                  color: colorPage.a14,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: width * 0.04,
                                                  height: width * 0.001)),
                                          Text(
                                            widget
                                                .bookingModel.serviceVehicle,
                                            style: TextStyle(
                                                fontSize: width * 0.04,
                                                fontWeight: FontWeight.w500,
                                                color: colorPage.eigthColor,
                                                height: width * 0.003),
                                          ),
                                          Text(
                                            widget.bookingModel.takeDate,
                                            style: TextStyle(
                                                fontSize: width * 0.035,
                                                fontWeight: FontWeight.w400,
                                                color: colorPage.eigthColor,
                                                height: width * 0.002),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(right: width * 0.055),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: colorPage.a23,
                                      size: width * 0.05,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Location",
                                style: TextStyle(
                                    color: colorPage.primaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: width * 0.052),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width * 0.05),
                                child: Text(
                                  widget.bookingModel.addYourLocation,
                                  style: TextStyle(
                                      fontSize: width * 0.043,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Payment method",
                                style: TextStyle(
                                  color: colorPage.primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: width * 0.052,
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Online payment",
                                        style: TextStyle(
                                            fontSize: width * 0.052,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        width: width * 0.03,
                                      ),
                                      // RadioMenuButton(value: value, groupValue: groupValue, onChanged: onChanged, child: child)
                                      RadioMenuButton(
                                          style: ButtonStyle(
                                            overlayColor:
                                                MaterialStatePropertyAll(
                                                    colorPage.nineColor),
                                          ),
                                          value: "Online payment",
                                          groupValue: tik,
                                          onChanged: (value) {
                                            setState(() {
                                              tik = value!;
                                            });
                                          },
                                          child: Text(""))
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Cash on delivery",
                                        style: TextStyle(
                                            fontSize: width * 0.052,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        width: width * 0.03,
                                      ),
                                      // RadioMenuButton(value: value, groupValue: groupValue, onChanged: onChanged, child: child)
                                      RadioMenuButton(
                                          style: ButtonStyle(
                                            overlayColor:
                                                MaterialStatePropertyAll(
                                                    colorPage.nineColor),
                                          ),
                                          value: "Cash on delivery",
                                          groupValue: tik,
                                          onChanged: (value) {
                                            setState(() {
                                              tik = value!;
                                            });
                                          },
                                          child: Text(""))
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: width * 0.16,
                      width: width * 1,
                      color: colorPage.secondaryColor,
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Price  :",
                              style: TextStyle(
                                fontSize: width * 0.055,
                                fontWeight: FontWeight.w600,
                                color: colorPage.a24,
                              ),
                            ),
                            SizedBox(width: width * 0.015),
                            Text(
                              "\$3600",
                              style: TextStyle(
                                fontSize: width * 0.08,
                                fontWeight: FontWeight.w700,
                                color: colorPage.primaryColor,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.15,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: width * 0.1,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          if (tik != "") {
                          BookingModel bookingModel=  widget.bookingModel.copyWith(
                              paymentMethod: tik,
                            );
                            // widget.slotbooking.addAll({"payment_method": tik});

                            FirebaseFirestore.instance
                                .collection("booking").add(
                                  bookingModel.toMap()).then((value)
                            {
                              value.update(
                                      bookingModel.copyWith(id: value.id).toMap()
                                  );
                            });

                            tik == "Online payment"
                                ? showModalBottomSheet(
                                    backgroundColor: colorPage.secondaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(width * 0.05),
                                          topRight:
                                              Radius.circular(width * 0.05)),
                                    ),
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height: width * 0.75,
                                        width: width * 1,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft:
                                                  Radius.circular(width * 0.05),
                                              topRight: Radius.circular(
                                                  width * 0.05)),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Icon(
                                                      CupertinoIcons.multiply,
                                                      color: colorPage.a25,
                                                      size: width * 0.07),
                                                ),
                                                Text(
                                                  "Add your bank account",
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: width * 0.06,
                                                      color: colorPage
                                                          .primaryColor),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "To book your service on Quick was you need\nto add a bank account",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: width * 0.05,
                                                  color: colorPage.fiftColor),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Payment(),
                                                    ));
                                              },
                                              child: Container(
                                                height: width * 0.13,
                                                width: width * 0.4,
                                                decoration: BoxDecoration(
                                                    color:
                                                        colorPage.primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            width * 1)),
                                                child: Center(
                                                  child: Text("Get started",
                                                      style: TextStyle(
                                                          color: colorPage
                                                              .secondaryColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize:
                                                              width * 0.05)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                : showModalBottomSheet(
                                    backgroundColor: colorPage.secondaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(width * 0.05),
                                          topRight:
                                              Radius.circular(width * 0.05)),
                                    ),
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height: width * 0.9,
                                        width: width * 1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                height: width * 0.35,
                                                width: width * 0.35,
                                                child: Lottie.asset(
                                                    imagePage.lottie)),
                                            Text(
                                              "Booking successful",
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: width * 0.08,
                                                  color:
                                                      colorPage.primaryColor),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                            if (tik != "Online payment") {
                              Future.delayed(Duration(seconds: 3))
                                  .then((value) => Navigator.pushReplacement(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => bottom_bar(),
                                      )));
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("enter your payment method")));
                          }
                        },
                        child: Container(
                          height: width * 0.13,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                              color: colorPage.primaryColor,
                              borderRadius: BorderRadius.circular(width * 1)),
                          child: Center(
                            child: Text("Proceed",
                                style: TextStyle(
                                    color: colorPage.secondaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: width * 0.05)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: width * 0.005,
                    ),
                  ],
                ))));
  }
}
