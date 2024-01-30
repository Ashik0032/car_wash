import 'dart:io';

import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'main.dart';

class edit_profile extends StatefulWidget {
  const edit_profile({super.key, required this.name1, required this.email,
    required this.password, required this.image, required this.number,/* required this.id */});
  final String name1;
  final String email;
  final String password;
  final String number;
   // final String id;
  final String image;


  @override
  State<edit_profile> createState() => _edit_profileState();
}

class _edit_profileState extends State<edit_profile> {

  String imageurl = "";

  bool tap = true;
  TextEditingController name_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController number_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  final emailvallidation =
  RegExp(r"^[a-z0-9.a-z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-z0-9]+\.[a-z]+");
  final passwordvallidation =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  final formkey = GlobalKey<FormState>();
  var file;
  pickFile(ImageSource) async {
    final imageFile = await ImagePicker.platform.pickImage(source: ImageSource);
    file = File(imageFile!.path);
    if (mounted) {
      setState(() {
        file = File(imageFile.path);
      });
      uploadFile();
    }
  }

  uploadFile() async {
    if (file != null) {
      var uploadTask = await FirebaseStorage.instance
          .ref('images')
          .child("${DateTime.now()}")
          .putFile(file!);

      imageurl = await uploadTask.ref.getDownloadURL();
      print(imageurl);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("image uploaded")));

      setState(() {});
      Navigator.pop(context);
    }
  }
  @override
  void initState() {
    name_controller.text=widget.name1;
    email_controller.text=widget.email;
    password_controller.text=widget.password;
    number_controller.text=widget.number;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPage.secondaryColor,
      // backgroundColor: Colors.yellow,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: colorPage.secondaryColor,
        leading: Padding(
          padding: EdgeInsets.all(width * 0.043),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                height: width * 0.03,
                width: width * 0.03,
                child: SvgPicture.asset(imagePage.arrow)
            ),
          ),
        ),
        title: Text("Edit User",
            style: TextStyle(
              fontSize: width * 0.055,
              fontWeight: FontWeight.w500,
              color: colorPage.thirdColor,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.all(width * 0.05),
        child: SingleChildScrollView(
          child: Container(
            height: width * 2.25,
            width: width * 1,
            child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        // imageurl == ""
                        //     ? Container(
                        //         height: width * 0.4,
                        //         width: width * 0.4,
                        //         decoration: BoxDecoration(
                        //             shape: BoxShape.circle,
                        //             image: DecorationImage(
                        //                 image: AssetImage(imagePage.profile),
                        //                 fit: BoxFit.cover)),
                        //       )
                        //     :
                        CircleAvatar(
                          radius: width * 0.19,
                          backgroundColor: colorPage.secondaryColor,
                          backgroundImage: NetworkImage(widget.image),

                        ),
                        Positioned(
                          bottom: width * 0,
                          left: width * 0.25,
                          child: InkWell(
                            onTap: () {
                              showCupertinoModalPopup(
                                barrierColor: colorPage.a31,
                                context: context,
                                builder: (context) {
                                  return CupertinoActionSheet(
                                    actions: [
                                      CupertinoActionSheetAction(
                                        onPressed: () {
                                          pickFile(ImageSource.gallery);
                                        },
                                        child: Text("Photo Gallery",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: width * 0.05)),
                                        isDefaultAction: true,
                                      ),
                                      CupertinoActionSheetAction(
                                        onPressed: () {
                                          pickFile(ImageSource.camera);
                                        },
                                        child: Text("Camera",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: width * 0.05)),
                                        isDefaultAction: true,
                                      ),
                                    ],
                                    cancelButton: CupertinoActionSheetAction(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: width * 0.05),
                                        )),
                                  );
                                },
                              );
                            },
                            child: CircleAvatar(
                              radius: width * 0.05,
                              backgroundColor: colorPage.primaryColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(imagePage.upload),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: width * 0.05,
                    ),
                    Container(
                      height: width * 1,

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextFormField(
                            controller: name_controller,
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.done,
                            style: TextStyle(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.w600,
                                color: colorPage.primaryColor),
                            decoration: InputDecoration(
                                labelText: "Your name",
                                labelStyle: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.w400,
                                    color: colorPage.fortColor),
                                hintText: "pleace enter your name",
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
                          TextFormField(
                            controller: email_controller,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.done,
                            style: TextStyle(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.w600,
                                color: colorPage.primaryColor),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (!emailvallidation.hasMatch(value!)) {
                                return "enter valid email";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "email",
                              labelStyle: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.w400,
                                  color: colorPage.fortColor),
                              hintText: "pleace enter your email",
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
                                  )),
                            ),
                          ),
                          TextFormField(
                            controller: password_controller,
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.done,
                            obscureText: tap ? true : false,
                            maxLength: 8,
                            style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.w600,
                            ),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                                suffixIcon: InkWell(
                                    onTap: () {
                                      tap = !tap;
                                      setState(() {});
                                    },
                                    child: Icon(tap
                                        ? Icons.visibility_off
                                        : Icons.visibility)),
                                labelText: "Password",
                                counterText: "",
                                labelStyle: TextStyle(
                                    fontSize: width * 0.05,
                                    color: colorPage.fortColor,
                                    fontWeight: FontWeight.w400),
                                hintText: "pleace enter your password",
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
                          TextFormField(
                            controller: number_controller,
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            textInputAction: TextInputAction.done,
                            maxLength: 10,
                            style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.w600,
                            ),
                            // autovalidateMode: AutovalidateMode.onUserInteraction,
                            // validator: (value) {
                            //   if (!numbervallidation.hasMatch(value!)) {
                            //     return "enter valid number";
                            //   } else {
                            //     return null;
                            //   }
                            // },
                            decoration: InputDecoration(
                                labelText: "Contact number",
                                counterText: "",
                                labelStyle: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.w400,
                                    color: colorPage.fortColor),
                                hintText: "pleace enter your number",
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: width * 0.05,
                    ),
                    InkWell(
                      onTap: () {
                        showCupertinoModalPopup(
                          barrierColor: colorPage.a31,
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              content: Text(
                                  "Are you Sure\nYou Want to Update Details?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: width * 0.045)),
                              actions: [
                                CupertinoDialogAction(
                                  isDestructiveAction: true,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancel"),
                                ),
                                CupertinoDialogAction(
                                  isDefaultAction: true,
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection('carwash')
                                        .doc(currentUserid)
                                        .update({
                                      'name': name_controller.text,
                                      'email': email_controller.text,
                                      'password': password_controller.text,
                                      "phone_number":number_controller.text,
                                      "images": imageurl
                                    });
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: Text("Confirm"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        height: width * 0.13,
                        width: width * 0.65,
                        decoration: BoxDecoration(
                          // color: colorPage.secondaryColor,
                            border: Border.all(
                                color: colorPage.primaryColor,
                                width: width * 0.006),
                            borderRadius: BorderRadius.circular(width * 1)),
                        child: Center(
                          child: Text("Edit User",
                              style: GoogleFonts.montserrat(
                                  color: colorPage.primaryColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: width * 0.045)),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
