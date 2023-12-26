import 'package:car_wash/Confirmation.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:car_wash/take_a_slot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'main.dart';

class orderDetails extends StatefulWidget {
  const orderDetails({super.key});

  @override
  State<orderDetails> createState() => _orderDetailsState();
}

class _orderDetailsState extends State<orderDetails> {
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
            "Order details",
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
                 left: width * 0.05, right: width * 0.05,),
            child: Container(
                height: width * 2.33,
                width: width * 1,
                // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: width * 0.52,
                      width: width * 1,
                      decoration: BoxDecoration(
                        color: colorPage.primaryColor,
                        image: DecorationImage(image: AssetImage(imagePage.car5),fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(width*0.02)
                      ),

                    ),
                    SizedBox(height: width*0.03,),
                    Text(
                      "Vehicle",
                      style: TextStyle(
                        color: colorPage.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.052,
                      ),
                    ),
                    Text("Vehicle                              :    Car",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: width*0.05,
                      color: colorPage.a14,
                    ),),
                    Text("Model                                :    M5",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: width*0.05,
                      color: colorPage.a14,
                    ),),
                    Text("Reg.number                   :    KL-53 SG 4357",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: width*0.05,
                      color: colorPage.a14,
                    ),),
                    Text("Client                                 :    Navaneey",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: width*0.05,
                      color: colorPage.a14,
                    ),),
                    Text("Phone                                :    +624 76597 26",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: width*0.05,
                      color: colorPage.a14,
                    ),),
                    SizedBox(height: width*0.03,),

                    Text(
                      "Service details",
                      style: TextStyle(
                        color: colorPage.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.052,
                      ),
                    ),
                    Text("service                              :    Prowash",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: width*0.05,
                        color: colorPage.a14,
                      ),),
                    SizedBox(height: width*0.03,),
                    Text(
                      "Slot date",
                      style: TextStyle(
                        color: colorPage.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.052,
                      ),
                    ),
                    Text("Date                                    :    26/03/2022 ",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: width*0.05,
                        color: colorPage.a14,
                      ),),
                    Text("Time                                    :   09:00am",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: width*0.05,
                        color: colorPage.a14,
                      ),),
                    SizedBox(height: width*0.03,),
                    Text(
                      "Payment  details",
                      style: TextStyle(
                        color: colorPage.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.052,
                      ),
                    ),
                    Text("Payment method       :    Online payment",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: width*0.05,
                        color: colorPage.a14,
                      ),),
                    Text("Payment status            :    Payment completed",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: width*0.049,
                        color: colorPage.a14,
                      ),),



                  ],
                ))));
  }
}
