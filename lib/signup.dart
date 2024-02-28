import 'dart:io';

import 'package:car_wash/bottom_bar.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/google_sign_in.dart';
import 'package:car_wash/home.dart';
import 'package:car_wash/image_page.dart';
import 'package:car_wash/login.dart';
import 'package:car_wash/contact number.dart';
import 'package:car_wash/model/user_Model.dart';
import 'package:car_wash/on_site.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class signup extends StatefulWidget {
  const signup({super.key, required this.sign});
  final bool sign;
  @override
  State<signup> createState() => _signupState();
}
class _signupState extends State<signup> {
  // setdata() async {
  //   SharedPreferences _prefs =await SharedPreferences.getInstance();
  //   _prefs.setBool("signup",true);
  //   _prefs.setString("sign", name_controller.text.toString());
  // }

  bool tap = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  final emailvallidation =
      RegExp(r"^[a-z0-9.a-z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-z0-9]+\.[a-z]+");

  final numbervallidation = RegExp(r'[0-9]{10}');
  bool tik = false;
  final formkey = GlobalKey<FormState>();
  String imageurl = "";

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
    if (widget.sign == true) {
      emailController.text = currentUserEmail!.toString();
      nameController.text = currentUserName!.toString();
      // imageurl =  currentUserimage.toString();
    }


    // setdata();
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(width * 0.05),
        child: SingleChildScrollView(
          child: Container(
            height: width * 2.25,
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: width * 0.02,
                  ),
                  Column(
                    children: [
                      Center(
                        child: Text(
                          "Welcome",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: width * 0.08,
                            color: colorPage.primaryColor,
                          ),
                        ),
                      ),
                      Text(
                        "Please create a new account",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.055,
                          color: colorPage.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Stack(
                        children: [
                          widget.sign!=true?
               imageurl==""?Container(
                   height: width * 0.4,
                   width: width * 0.4,
                   decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       image: DecorationImage(
                           image: AssetImage(imagePage.profile),
                           fit: BoxFit.cover)),
                 )
                     :
                 CircleAvatar(
                   radius: width * 0.19,
                   backgroundColor: colorPage.secondaryColor,
                   backgroundImage: NetworkImage(imageurl),

                 ):
                          imageurl==""?Container(
                            height: width * 0.4,
                            width: width * 0.4,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(currentUserimage!),
                                    fit: BoxFit.cover)),
                          )
                              :
                          CircleAvatar(
                            radius: width * 0.19,
                            backgroundColor: colorPage.secondaryColor,
                            backgroundImage: NetworkImage(imageurl),

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
                                            setState(() {
                                            });
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
                                  padding:  EdgeInsets.all(8.0),
                                  child: Image.asset(imagePage.upload),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: width * 0.08,
                      ),
                      TextFormField(
                        controller: nameController,
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
                      SizedBox(
                        height: width * 0.08,
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        readOnly: widget.sign,
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
                      SizedBox(
                        height: width * 0.08,
                      ),
                      TextFormField(
                        controller: passwordController,
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
                      SizedBox(
                        height: width * 0.08,
                      ),
                      TextFormField(
                        controller: numberController,
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
                  // SizedBox(height: width*0.03,),
                  Container(
                    height: width * 0.2,
                    width: width * 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () async {
                            if (nameController.text != "" &&
                                emailController.text != "" &&
                                passwordController.text != "" &&
                                numberController.text != "" &&
                                imageurl !="" &&
                                formkey.currentState!.validate()) {


                              if (widget.sign == true) {

                                userModel  loginModelData=userModel(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  phoneNumber: numberController.text,
                                  images: imageurl,
                                  google: true,
                                  vehicles: []
                                );

                             await  FirebaseFirestore.instance.collection("carwash").add(loginModelData.toMap()

                             ).then((value){
                               value.update(
                                 // "id":value.id
                                   loginModelData.copyWith(id: value.id).toMap()

                               );
                            currentUserid= value.id;
                             });
                                currentUserName = nameController.text;

                                Future.delayed(Duration(seconds: 1)).then((value){
                                  emailController.clear();
                                  // nameController.clear();
                                  // emailController.clear();
                                  // passwordController.clear();
                                  // numberController.clear();

                                });


                                // var passid= await  FirebaseFirestore.instance
                                //     .collection("carwash")
                                //     .add({
                                //   "name": nameController.text,
                                //   "email": emailController.text,
                                //   "password": passwordController.text,
                                //   "phoneNumber": numberController.text,
                                //   "images":imageurl,
                                //   "google":true,
                                //   "vehicles": [],
                                //   // "id": currentUserid,
                                // });

                                // setdata();

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => login(email: emailController.text, password: passwordController.text,),
                                    ));

                              }
                              else{
                                FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text)
                                    .then((value) {

                                  userModel  loginModelData=userModel(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      phoneNumber: numberController.text,
                                      images: imageurl,
                                      google: false,
                                      vehicles: []
                                  );

                                  FirebaseFirestore.instance.collection("carwash").add(loginModelData.toMap()).then((value){
                                    value.update(
                                     // "id":value.id
                                        loginModelData.copyWith(id: value.id).toMap()
                                    );
                                  });

                                  currentUserName = nameController.text;

                                  // setdata();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => login(email: emailController.text, password: passwordController.text,),
                                    ),);
                                  Future.delayed(Duration(seconds: 1)).then((value){
                                    nameController.clear();
                                    emailController.clear();
                                    passwordController.clear();
                                    numberController.clear();

                                  });
                                }).catchError((error) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                          Text(error.toString())));
                                });

                                // FirebaseFirestore.instance
                                  //     .collection("carwash")
                                  //     .add({
                                  //   // "name": nameController.text,
                                  //   // "email": emailController.text,
                                  //   // "password": passwordController.text,
                                  //   // "phoneNumber": numberController.text,
                                  //   "images":imageurl,
                                  //   "google":false,
                                  //   "vehicles": [],
                                  //   // "id": currentUserid,
                                  // }).then((value){
                                  //   value.update({
                                  //     "id":value.id
                                  //   });
                                  // });


                              }
                            } else {
                              if(widget.sign!=true){
                                nameController.text == ""
                                    ? ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                        Text("please enter your name!")))
                                    : emailController.text == ""
                                    ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content:
                                    Text("please enter your email!")))
                                    : passwordController.text == ""
                                    ? ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                    content: Text(
                                        "please enter your password!")))
                                    : numberController.text == ""
                                    ? ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                    content: Text(
                                        "please enter your contact number!")))
                                    : imageurl == ""
                                    ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content:
                                    Text("please add your images!")))
                                    : ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                    SnackBar(content: Text("pleace enter your valid details")));

                              }

                              nameController.text == ""
                                  ? ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                      Text("please enter your name!")))
                                  : emailController.text == ""
                                  ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content:
                                  Text("please enter your email!")))
                                  : passwordController.text == ""
                                  ? ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                  content: Text(
                                      "please enter your password!")))
                                  : numberController.text == ""
                                  ? ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                  content: Text(
                                      "please enter your contact number!")))
                                  : imageurl == ""
                                  ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content:
                                  Text("add new images!")))
                                  : ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                  SnackBar(content: Text("pleace enter your valid details")));


                            }
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
                        InkWell(
                          onTap: () {
                            // Navigator.push(context, CupertinoPageRoute(builder: (context) => login(email: "", password: ""),));
                            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) =>
                                login(email: '', password: '',),), (route) => false);
                          },
                          child: RichText(
                            text: TextSpan(
                              text: "Already have an accound?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: colorPage.fortColor),
                              children: [
                                TextSpan(
                                    text: "Sign in",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: colorPage.primaryColor)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
