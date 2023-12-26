import 'dart:io';

import 'package:car_wash/Add_vehicle.dart';
import 'package:car_wash/Take_a_slot-1.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'Custom_wash.dart';
import 'home.dart';
import 'main.dart';

class takeaslot extends StatefulWidget {
  const takeaslot({super.key});

  @override
  State<takeaslot> createState() => _takeaslotState();
}

class _takeaslotState extends State<takeaslot> {
  String? dropdown_value;
  var listItem = ["Car-M5-KL-53 SG 4357", "Car-ShiftM5-KL-10 AB 4357"];
  List set = [
    {
      "image": imagePage.car6,
      "text": "Quick wash",
    },
    {"image": imagePage.car7, "text": "Power wash"},
    {"image": imagePage.car8, "text": "Pro wash"},
    {
      "image": imagePage.carservice1,
      "text": "Custom wash",
    },
  ];
  List tap1 = ["On site", "Self visit", "Pic up  and drop"];

  int selectedOption = 0;
  int tap = 0;

  var file;
  pickFile(ImageSource) async {
    final imageFile=await ImagePicker.platform.pickImage(source: ImageSource);
    file=File(imageFile!.path);
    if(mounted){
      setState(() {
        file=File(imageFile.path);
      });
    }
  }
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
                      builder: (context) => home(),
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
            "Booking",
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
              child: Container(
                  height: width * 2.33,
                  width: width * 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Service vehicle",
                        style: TextStyle(
                            color: colorPage.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.052),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: width * 0.025,
                            left: width * 0.025,
                            bottom: width * 0.025,
                            top: width * 0.01),
                        child: Container(
                          height: width * 0.16,
                          width: width * 0.85,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: colorPage.primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(width * 0.03),
                          ),
                          child: DropdownButton(
                            padding: EdgeInsets.all(width * 0.04),
                            hint: Text("vehicle Number"),
                            dropdownColor: Colors.white,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: colorPage.primaryColor,
                            ),
                            iconSize: width * 0.08,
                            isExpanded: true,
                            underline: SizedBox(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width * 0.05,
                            ),
                            value: dropdown_value,
                            onChanged: (newValue) {
                              setState(() {
                                dropdown_value = newValue;
                              });
                            },
                            items: listItem.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: width * 0.02,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => addVehicle(),
                                ));
                          },
                          child: Container(
                            height: width * 0.13,
                            width: width * 0.4,
                            child: Center(
                              child: Text("Add another",
                                  style: TextStyle(
                                      fontSize: width * 0.055,
                                      fontWeight: FontWeight.w600)),
                            ),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: colorPage.primaryColor),
                                borderRadius:
                                    BorderRadius.circular(width * 0.1)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: width * 0.03,
                      ),
                      Row(
                        children: [
                          Text(
                            "Add image",
                            style: TextStyle(
                                color: colorPage.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: width * 0.052),
                          ),
                          SizedBox(
                            width: width * 0.015,
                          ),
                          Text(
                            "(Optional)",
                            style: TextStyle(
                                fontSize: width * 0.042,
                                fontWeight: FontWeight.w400,
                                color: colorPage.primaryColor),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: width * 0.025,
                            left: width * 0.025,
                            bottom: width * 0.025,
                            top: width * 0.01),
                        child: InkWell(
                          onTap: () {
                            pickFile(ImageSource.gallery);
                          },
                           child: file!=null?
                               Container(
                                 height: width * 0.52,
                                 width: width * 0.9,
                                 color: colorPage.secondaryColor,
                                 child: Image.file(file,fit: BoxFit.cover),
                                 ):
                           Container(
                             height: width * 0.52,
                             width: width * 0.9,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(width * 0.01),
                                 border: Border.all(color: colorPage.a20)),
                             child: Center(
                               child: Container(
                                 height: width * 0.3,
                                 width: width * 0.9,
                                 child: Column(
                                     mainAxisAlignment:
                                     MainAxisAlignment.spaceEvenly,
                                     children: [
                                       Container(
                                         height: width * 0.2,
                                         width: width * 0.2,
                                         child:
                                         Image.asset(imagePage.upload),
                                       ),
                                       Text(
                                           "Upload your vehicle image",
                                           style: GoogleFonts.montserrat(
                                             textStyle: TextStyle(
                                                 fontWeight: FontWeight.w700,
                                                 fontSize: width * 0.045,
                                                 color: colorPage.a21),
                                           )
                                       )
                                     ]),
                               ),
                             ),
                           ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Pic a service",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: width * 0.058,
                                fontWeight: FontWeight.w600,
                                color: colorPage.primaryColor,
                              )),
                          Text("View all",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: width * 0.036,
                                fontWeight: FontWeight.w500,
                                color: colorPage.tenColor,
                              )),
                        ],
                      ),
                      Container(
                        height: width * 0.28,
                        width: width * 1,
                        decoration: BoxDecoration(
                            // color: colorPage.secondaryColor,
                            borderRadius: BorderRadius.circular(width * 0.015)),
                        child: ListView.separated(
                          itemCount: set.length,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                selectedOption = index;
                                setState(() {});
                              },
                              child: Container(
                                height: width * 0.28,
                                width: width * 0.25,
                                decoration: BoxDecoration(
                                    color: selectedOption == index
                                        ? colorPage.a22
                                        : colorPage.secondaryColor,
                                    border: selectedOption == index
                                        ? Border.all(
                                            color: colorPage.primaryColor)
                                        : Border.all(
                                            color: colorPage.secondaryColor),
                                    borderRadius:
                                        BorderRadius.circular(width * 0.01)),
                                margin: EdgeInsets.all(width * 0.015),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: width * 0.015,
                                    ),
                                    Container(
                                        height: width * 0.14,
                                        width: width * 0.14,
                                        child:
                                            Image.asset(set[index]["image"])),
                                    Text(set[index]["text"],
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: width * 0.043,
                                          fontWeight: FontWeight.w500,
                                          color: colorPage.a11,
                                        )),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: width * 0.03,
                            );
                          },
                        ),
                      ),
                      Text("Pic your comfort",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: width * 0.058,
                            fontWeight: FontWeight.w600,
                            color: colorPage.primaryColor,
                          )),
                      Container(
                        height: width * 0.5,
                        width: width * 1,
                        child: ListView.builder(
                          itemCount: tap1.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: width * 0.03),
                              child: InkWell(
                                onTap: () {
                                  tap = index;
                                  setState(() {});
                                },
                                child: Container(
                                    height: width * 0.142,
                                    width: width * 0.85,
                                    decoration: BoxDecoration(
                                      color: tap == index
                                          ? colorPage.a22
                                          : colorPage.secondaryColor,
                                      border: Border.all(
                                        color: colorPage.primaryColor,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(width * 0.03),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: width * 0.075,
                                          right: width * 0.04),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            tap1[index],
                                            style: TextStyle(
                                                color: colorPage.primaryColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: width * 0.055),
                                          ),
                                          tap == index
                                              ? Icon(
                                                  Icons.check_circle,
                                                  color: colorPage.primaryColor,
                                                  size: width * 0.06,
                                                )
                                              : SizedBox(),
                                        ],
                                      ),
                                    )),
                              ),
                            );
                          },
                        ),

                        // SizedBox(height: width*0.04,),
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => booking_1(),
                                ));
                          },
                          child: Container(
                            height: width * 0.13,
                            width: width * 0.4,
                            decoration: BoxDecoration(
                                color: colorPage.primaryColor,
                                borderRadius: BorderRadius.circular(width * 1)),
                            child: Center(
                              child: Text("Next",
                                  style: TextStyle(
                                      color: colorPage.secondaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: width * 0.05)),
                            ),
                          ),
                        ),
                      ),

                    ],
                  )),
            )));
  }
}

// padding:  EdgeInsets.only(right: width*0.025,left: width*0.025,bottom: width*0.025,top: width*0.01),
// ),
