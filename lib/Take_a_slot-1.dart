import 'package:car_wash/Confirmation.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:car_wash/take_a_slot.dart';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'home.dart';
import 'main.dart';

class booking_1 extends StatefulWidget {
  const booking_1({super.key});

  @override
  State<booking_1> createState() => _booking_1State();
}

class _booking_1State extends State<booking_1> {
  String? choose;
  String? choose1;
  String? choose2;
  var item = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18"
  ];
  var item1 = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"];
  var item2 = ["2018", "2019", "2020", "2021", "2022", "2023", "2024", "2025"];
  List time = [
    "09:00am",
    "10:00am",
    "11:00am",
    "12:00pm",
    "01:00pm",
    "05:00pm",
    "03:00pm",
    "04:00pm"
  ];
  int set = 0;
  TextEditingController name_controller = TextEditingController();
  TextEditingController name_controller1 = TextEditingController();
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
                      builder: (context) => takeaslot(),
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
            "Take a slot",
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
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Take a date",
                        style: TextStyle(
                            color: colorPage.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.052),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: colorPage.primaryColor,
                            size: width * 0.115,
                          ),
                          Expanded(
                            child: DropdownDatePicker(
                              inputDecoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1.0),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          10))), // optional
                              // isDropdownHideUnderline: true, // optional
                              // optional
                              startYear: 1995, // optional
                              endYear: 2030, // optional
                              width: 19.0, // optional
                              selectedDay: 10, // optional
                              selectedMonth: 12, // optional
                              selectedYear: 2022, // optional
                              onChangedDay: (value) =>
                                  print('onChangedDay: $value'),
                              onChangedYear: (value) =>
                                  print('onChangedYear: $value'),
                              dayFlex: 2,
                              monthFlex: 2,
                              yearFlex: 3,
                              boxDecoration: BoxDecoration(
                                border:
                                    Border.all(color: colorPage.primaryColor),
                                borderRadius:
                                    BorderRadius.circular(width * 0.015),
                              ), // optional
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Pic slot",
                        style: TextStyle(
                            color: colorPage.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.052),
                      ),
                      Container(
                        height: width * 0.53,
                        child: GridView.builder(
                          itemCount: 8,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: width * 0.04,
                            mainAxisSpacing: width * 0.03,
                            childAspectRatio: 1.9,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                set = index;
                                setState(() {});
                              },
                              child: Container(
                                height: width * 0.145,
                                width: width * 0.3,
                                decoration: BoxDecoration(
                                  color: set == index
                                      ? colorPage.a22
                                      : colorPage.secondaryColor,
                                  borderRadius:
                                      BorderRadius.circular(width * 0.02),
                                  border:
                                      Border.all(color: colorPage.primaryColor),
                                ),
                                child: Center(
                                  child: Text(time[index],
                                      style: TextStyle(
                                          fontSize: width * 0.055,
                                          fontWeight: FontWeight.w500,
                                          color: colorPage.primaryColor)),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Add your note",
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
                            bottom: width * 0.025, top: width * 0.01),
                        child: TextFormField(
                          maxLines: 3,
                          controller: name_controller,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.done,
                          style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.w500,
                              height: width * 0.0028,
                              color: colorPage.a14),
                          decoration: InputDecoration(
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
                        "Add your location",
                        style: TextStyle(
                            color: colorPage.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.052),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: width * 0.06, top: width * 0.01),
                        child: TextFormField(
                          controller: name_controller1,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.done,
                          style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.w500,
                              height: width * 0.0028,
                              color: colorPage.a14),
                          decoration: InputDecoration(
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
                      Center(
                        child: Container(
                          height: width * 0.1,
                          width: width * 0.3,
                          decoration: BoxDecoration(
                              border: Border.all(color: colorPage.primaryColor),
                              borderRadius: BorderRadius.circular(width * 0.1)),
                          child: Center(
                            child: Text("From saved",
                                style: TextStyle(
                                    fontSize: width * 0.04,
                                    color: colorPage.primaryColor,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: width * 0.1,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => confirmation(),
                                ));
                          },
                          child: Container(
                            height: width * 0.13,
                            width: width * 0.4,
                            decoration: BoxDecoration(
                                color: colorPage.primaryColor,
                                borderRadius: BorderRadius.circular(width * 1)),
                            child: Center(
                              child: Text("Payment",
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
                  )),
            )));
  }
}

//
// Expanded(
// child: GridView.builder(
// itemCount: 8,
// physics: BouncingScrollPhysics(),
// gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 3,
// crossAxisSpacing: width*0.07,
// mainAxisSpacing: width*0.04,
// childAspectRatio: 1
// ),
// itemBuilder: (BuildContext context, int index) {
// return Container(
// height: width*0.03,
// width: width*0.03,
// decoration: BoxDecoration(
// color: Colors.green,
// borderRadius: BorderRadius.circular(width*0.03),
// ),
// );
// },
//
// ),
// )
