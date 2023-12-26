import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:car_wash/login_signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPage.nineColor,
      body: Padding(
        padding: EdgeInsets.only(
            top: width * 0.05, left: width * 0.05, right: width * 0.05),
        child: Container(
          height: width * 2.2,
          width: width * 1,
          // color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: width * 0.05),
              Center(
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: width * 0.08,
                    color: colorPage.primaryColor,
                  ),
                ),
              ),
              Container(
                height: width * 0.45,
                width: width * 1,
                decoration: BoxDecoration(
                    color: colorPage.secondaryColor,
                    borderRadius: BorderRadius.circular(width * 0.015),
                    border: Border.all(color: colorPage.primaryColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: width * 0.15,
                      backgroundImage: AssetImage(imagePage.person1),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Navaneey",
                                style: TextStyle(
                                  // fontSize:14.36,
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.w700,
                                  color: colorPage.primaryColor,
                                )),
                            SizedBox(
                              height: width * 0.01,
                            ),
                            Text(
                              "navannnea744@gmail.com",
                              style: TextStyle(
                                  color: colorPage.a14,
                                  fontWeight: FontWeight.w400,
                                  height: width * 0.0029,
                                  fontSize: width * 0.045),
                            ),
                            SizedBox(
                              height: width * 0.01,
                            ),
                            Text(
                              "+624 76597 26",
                              style: TextStyle(
                                  color: colorPage.a14,
                                  fontWeight: FontWeight.w400,
                                  height: width * 0.0029,
                                  fontSize: width * 0.045),
                            ),
                          ],
                        ),
                        Container(
                          height: width * 0.13,
                          width: width * 0.42,
                          decoration: BoxDecoration(
                              color: colorPage.primaryColor,
                              borderRadius: BorderRadius.circular(width * 1)),
                          child: Center(
                            child: Text("Edit profile",
                                style: TextStyle(
                                    color: colorPage.secondaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: width * 0.05)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  width: width * 0.85,
                  // color: Colors.red,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(CupertinoIcons.timer,
                            size: width * 0.075, color: colorPage.primaryColor),
                        title: Text(
                          "Recent orders",
                          style: TextStyle(
                              color: colorPage.primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.05),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: colorPage.primaryColor,
                          size: width * 0.045,
                        ),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(CupertinoIcons.car_detailed,
                            size: width * 0.075, color: colorPage.primaryColor),
                        title: Text(
                          "Added vehicles",
                          style: TextStyle(
                              color: colorPage.primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.05),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: colorPage.primaryColor,
                          size: width * 0.045,
                        ),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.wallet_outlined,
                            size: width * 0.075, color: colorPage.primaryColor),
                        title: Text(
                          "Payments",
                          style: TextStyle(
                              color: colorPage.primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.05),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: colorPage.primaryColor,
                          size: width * 0.045,
                        ),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.radio_button_checked,
                            size: width * 0.075, color: colorPage.primaryColor),
                        title: Text(
                          "Active requests",
                          style: TextStyle(
                              color: colorPage.primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.05),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: colorPage.primaryColor,
                          size: width * 0.045,
                        ),
                      ),
                      Divider(
                        thickness: width * 0.004,
                        color: colorPage.primaryColor,
                      ),
                      ListTile(
                        leading: Icon(CupertinoIcons.question_circle,
                            size: width * 0.075, color: colorPage.a16),
                        title: Text(
                          "FAQ",
                          style: TextStyle(
                              color: colorPage.a16,
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.05),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: colorPage.a16,
                          size: width * 0.045,
                        ),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.share,
                            size: width * 0.075, color: colorPage.a16),
                        title: Text(
                          "Share",
                          style: TextStyle(
                              color: colorPage.a16,
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.05),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: colorPage.a16,
                          size: width * 0.045,
                        ),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.star,
                            size: width * 0.075, color: colorPage.a16),
                        title: Text(
                          "Rate us",
                          style: TextStyle(
                              color: colorPage.a16,
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.05),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: colorPage.a16,
                          size: width * 0.045,
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    "are you sure you want to exit",
                                  ),
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => login_Signup(),));
                                        },
                                        child: Container(
                                          height: width*0.1,
                                          width: width*0.2,
                                          decoration: BoxDecoration(
                                              color: colorPage.primaryColor,
                                              borderRadius: BorderRadius.circular(width*0.03)
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Yes",
                                              style: TextStyle(
                                                color: colorPage.secondaryColor
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          height: width*0.1,
                                          width: width*0.2,
                                          decoration: BoxDecoration(
                                              color: colorPage.primaryColor,
                                              borderRadius: BorderRadius.circular(width*0.03)
                                          ),
                                          child: Center(
                                            child: Text(
                                              "No",
                                              style: TextStyle(
                                                color: colorPage.secondaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        child: ListTile(
                          leading: Icon(Icons.logout,
                              size: width * 0.075, color: colorPage.primaryColor),
                          title: Text(
                            "Log out",
                            style: TextStyle(
                                color: colorPage.primaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize: width * 0.05),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
