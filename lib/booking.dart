import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:car_wash/order_details.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class booking extends StatefulWidget {
  const booking({super.key});

  @override
  State<booking> createState() => _bookingState();
}

class _bookingState extends State<booking> {
  List booking = [
    {
      "image": imagePage.car9,
      "text": "Custom wash",
      "text1": "Car- ShiftM5\nKL-10 AB 4357\n01/04/2022",
    },
    {
      "image": imagePage.car10,
      "text": "Quick wash",
      "text1": "Car-M5\nKL-53 SG 4357\n26/03/2022",
    },
  ];
  List service = [
    {
      "image": imagePage.car9,
      "text": "Custom wash",
      "text1": "Car- ShiftM5\nKL-10 AB 4357\n26/03/2022",
    },
    {
      "image": imagePage.car5,
      "text": "Prowash",
      "text1": "Car-M5\nKL-53 SG 4357\n26/03/2022",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorPage.nineColor,
        body: Padding(
          padding: EdgeInsets.only(
              top: width * 0.05, left: width * 0.05, right: width * 0.05),
          child: Container(
            height: width * 2,
            width: width * 1,
            // color: Colors.red,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: width * 0.09,
                    ),
                    Center(
                      child: Text(
                        "Bookings",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: width * 0.08,
                          color: colorPage.primaryColor,
                        ),
                      ),
                    ),
                    TextFormField(
                      // controller: number_controller,
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.search,
                      // readOnly: true,
                      style: TextStyle(
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.w600,
                      ),
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          hintText: "Search bookings",
                          hintStyle: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.w400,
                            color: colorPage.sixtColor,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(width * 0.025),
                              borderSide: BorderSide(
                                color: colorPage.primaryColor,
                              )),
                          suffixIcon: Icon(Icons.search)),
                    ),
                    Text("Currently actived",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: width * 0.058,
                          fontWeight: FontWeight.w600,
                          color: colorPage.primaryColor,
                        )),
                    Container(
                      height: width * 0.27,
                      width: width * 1,
                      decoration: BoxDecoration(
                          color: colorPage.secondaryColor,
                          borderRadius: BorderRadius.circular(width * 0.015)),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(width * 0.025),
                            child: Container(
                              height: width * 0.25,
                              width: width * 0.23,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(imagePage.car5),
                                      fit: BoxFit.cover),
                                  // color: Colors.greenAccent,
                                  borderRadius:
                                      BorderRadius.circular(width * 0.015)),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Prowash",
                                  style: TextStyle(
                                    // fontSize:14.36,
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.w700,
                                    color: colorPage.primaryColor,
                                  )),
                              Text(
                                "Car-M5\nKL-53 SG 4357\n26/03/2022",
                                style: TextStyle(
                                    color: colorPage.eigthColor,
                                    fontWeight: FontWeight.w400,
                                    height: width * 0.0029,
                                    fontSize: width * 0.036),
                              ),
                              Row(
                                children: [
                                  Text("------"),
                                  Image.asset(
                                    imagePage.circle,
                                    width: width * 0.025,
                                  ),
                                  SizedBox(
                                    width: width * 0.01,
                                  ),
                                  Text("Vehicle reached at center",
                                      style: TextStyle(
                                          fontSize: width * 0.03,
                                          fontWeight: FontWeight.w600,
                                          color: colorPage.primaryColor)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text("Bookings",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: width * 0.058,
                          fontWeight: FontWeight.w600,
                          color: colorPage.primaryColor,
                        )),
                    ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: 2,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>orderDetails(),));
                          },
                          child: Container(
                            height: width * 0.27,
                            width: width * 1,
                            decoration: BoxDecoration(
                                color: colorPage.secondaryColor,
                                borderRadius:
                                    BorderRadius.circular(width * 0.015)),
                            margin: EdgeInsets.all(width * 0.015),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(width * 0.025),
                                  child: Container(
                                    height: width * 0.25,
                                    width: width * 0.23,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                booking[index]["image"]),
                                            fit: BoxFit.cover),
                                        // color: Colors.greenAccent,
                                        borderRadius:
                                            BorderRadius.circular(width * 0.015)),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(booking[index]["text"],
                                        style: TextStyle(
                                          // fontSize:14.36,
                                          fontSize: width * 0.05,
                                          fontWeight: FontWeight.w700,
                                          color: colorPage.primaryColor,
                                        )),
                                    Text(
                                      booking[index]["text1"],
                                      style: TextStyle(
                                          color: colorPage.eigthColor,
                                          fontWeight: FontWeight.w400,
                                          height: width * 0.0029,
                                          fontSize: width * 0.036),
                                    ),
                                    Row(
                                      children: [
                                        Text("Expected on  04/04/2022",
                                            style: TextStyle(
                                                fontSize: width * 0.03,
                                                fontWeight: FontWeight.w600,
                                                color: colorPage.primaryColor)),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Container();
                      },
                    ),
                    Text("Serviced",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: width * 0.058,
                          fontWeight: FontWeight.w600,
                          color: colorPage.primaryColor,
                        )),
                    ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: 2,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: width * 0.27,
                          width: width * 1,
                          decoration: BoxDecoration(
                              color: colorPage.secondaryColor,
                              borderRadius:
                                  BorderRadius.circular(width * 0.015)),
                          margin: EdgeInsets.all(width * 0.015),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(width * 0.025),
                                child: Container(
                                  height: width * 0.25,
                                  width: width * 0.23,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              service[index]["image"]),
                                          fit: BoxFit.cover),
                                      // color: Colors.greenAccent,
                                      borderRadius:
                                          BorderRadius.circular(width * 0.015)),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(service[index]["text"],
                                      style: TextStyle(
                                        // fontSize:14.36,
                                        fontSize: width * 0.05,
                                        fontWeight: FontWeight.w700,
                                        color: colorPage.primaryColor,
                                      )),
                                  Text(
                                    service[index]["text1"],
                                    style: TextStyle(
                                        color: colorPage.eigthColor,
                                        fontWeight: FontWeight.w400,
                                        height: width * 0.0029,
                                        fontSize: width * 0.036),
                                  ),
                                  Row(
                                    children: [
                                      Text("------"),
                                      Image.asset(
                                        imagePage.circle,
                                        width: width * 0.025,
                                      ),
                                      SizedBox(
                                        width: width * 0.01,
                                      ),
                                      Text("Vehicle dropped successefully",
                                          style: TextStyle(
                                              fontSize: width * 0.03,
                                              fontWeight: FontWeight.w600,
                                              color: colorPage.a13)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Container();
                      },
                    ),
                  ]),
            ),
          ),
        ));
  }
}
