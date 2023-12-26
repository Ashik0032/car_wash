import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

import 'home.dart';
import 'main.dart';

class addVehicle extends StatefulWidget {
  const addVehicle({super.key});

  @override
  State<addVehicle> createState() => _addVehicleState();
}

class _addVehicleState extends State<addVehicle> {
  String? dropdown_value;
  String? dropdown1_value;
  List<String> selectItem = [];

  Map<String, List<String>> listItem = {
    "Car": ["Shift-M5", "M5"],
    "Bike": ["KTM-200", "RC-390"],
  };
  TextEditingController name_controller = TextEditingController();
  TextEditingController name_controller1 = TextEditingController();
  bool tik = false;

  @override
  void initState() {
    // TODO: implement initState
    print(listItem.keys);
    super.initState();
  }

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
          "Add vehicle",
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
            height: height * 0.82,
            width: width * 1,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "enter Your vehicle",
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
                              hint: Text("Enter your vehicle"),
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
                                dropdown_value = newValue!;
                                print(newValue);
                                selectItem = listItem[newValue]!;
                                dropdown1_value = null;
                                print(selectItem);
                                setState(() {});
                              },
                              items: listItem.keys.toList().map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem,
                                      style: TextStyle(
                                          fontSize: width * 0.055,
                                          color: colorPage.a14,
                                          fontWeight: FontWeight.w500)),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.02,
                        ),
                        Text(
                          "Model",
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
                              hint: Text("Enter your vehicle model"),
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
                              value: dropdown1_value,
                              onChanged: (newValue) {
                                setState(() {
                                  dropdown1_value = newValue.toString();
                                  print(selectItem);
                                });
                              },
                              items: selectItem.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem,
                                      style: TextStyle(
                                          fontSize: width * 0.055,
                                          color: colorPage.a14,
                                          fontWeight: FontWeight.w500)),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Text(
                          "Reg.number",
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
                          child: TextFormField(
                            controller: name_controller,
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.done,
                            style: TextStyle(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.w600,
                                height: width * 0.0028,
                                color: colorPage.a14),
                            decoration: InputDecoration(
                                hintText: "pleace enter your Reg.number",
                                hintStyle: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.w400,
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
                        Text(
                          "Client",
                          style: TextStyle(
                              color: colorPage.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: width * 0.052),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: width * 0.025,
                              left: width * 0.025,
                              bottom: width * 0.01,
                              top: width * 0.01),
                          child: TextFormField(
                            controller: name_controller1,
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.done,
                            style: TextStyle(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.w600,
                                height: width * 0.0028,
                                color: colorPage.a14),
                            decoration: InputDecoration(
                                hintText: "pleace enter your name",
                                hintStyle: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.w400,
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
                      ],
                    ),
                  ),
                  InkWell(
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
                                  "Vehicle added",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                      fontSize: width * 0.08,
                                      color: colorPage.primaryColor),
                                ),
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
                        child: Text("Add",
                            style: TextStyle(
                                color: colorPage.secondaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: width * 0.05)),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

//
//
