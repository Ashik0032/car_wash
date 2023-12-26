import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:car_wash/take_a_slot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'home.dart';
import 'main.dart';

class customWash extends StatefulWidget {
  const customWash({super.key});

  @override
  State<customWash> createState() => _customWashState();
}

class _customWashState extends State<customWash> {
  List text = [
    "Interial towel cleaning",
    "Towel hand dry",
    "Hand waxing",
    "Under body cleaning",
    "Foam/steam washing",
    "Door pad polish",
    "Trunk vaccum",
    "Mat washing",
    "Tire dressing",
  ];
  bool tik = false;
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
            "Custom wash",
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
                  height: width * 2.23,
                  width: width * 1,
                  // color: Colors.red,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: width * 0.49,
                          width: width * 0.75,
                          //color: Colors.green,
                          child: Image.asset(imagePage.car1),
                        ),
                        Text(
                          "Let’s clean simply",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: width * 0.063,
                            color: colorPage.primaryColor,
                          ),
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet consectetur. Leo\nporttitor sit purus urna. Habitant volutpat m  ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: width * 0.042,
                            color: colorPage.a14,
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: text.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return checkboxClass(text: text[index]);
                          },
                        ),
                        Container(
                          height: width * 0.16,
                          width: width * 1,
                          color: colorPage.secondaryColor,
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "\$470/-",
                                  style: TextStyle(
                                    fontSize: width * 0.08,
                                    fontWeight: FontWeight.w700,
                                    color: colorPage.a14,
                                  ),
                                ),
                                SizedBox(width: width * 0.015),
                                Text(
                                  "only",
                                  style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.w500,
                                    color: colorPage.a14,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.05,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => takeaslot(),
                                ));
                          },
                          child: Container(
                            height: width * 0.13,
                            width: width * 0.4,
                            decoration: BoxDecoration(
                                color: colorPage.primaryColor,
                                borderRadius: BorderRadius.circular(width * 1)),
                            child: Center(
                              child: Text("Book",
                                  style: TextStyle(
                                      color: colorPage.secondaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: width * 0.05)),
                            ),
                          ),
                        ),
                      ])),
            )));
  }
}

class checkboxClass extends StatefulWidget {
  const checkboxClass({super.key, required this.text});
  final String text;

  @override
  State<checkboxClass> createState() => _checkboxClassState();
}

class _checkboxClassState extends State<checkboxClass> {
  bool tik = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: tik,
          activeColor: colorPage.primaryColor,
          onChanged: (value) {
            setState(() {
              tik = value!;
            });
          },
        ),
        Text(
          widget.text,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: width * 0.045,
            color: colorPage.a14,
          ),
        ),
      ],
    );
  }
}
