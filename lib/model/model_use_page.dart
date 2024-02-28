import 'package:car_wash/model/user_Model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class model extends StatefulWidget {
  const model({super.key});

  @override
  State<model> createState() => _modelState();
}

class _modelState extends State<model> {
  TextEditingController namecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Padding(
        padding:  EdgeInsets.all(width*0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              controller: namecontroller,
              decoration: InputDecoration(
                 hintText: "name"
              ),

            ),
            TextFormField(
              controller: emailcontroller,
              decoration: InputDecoration(
                  hintText: "email"
              ),

            ),
            TextFormField(
              controller:passwordcontroller ,
              decoration: InputDecoration(
                  hintText: "password"
              ),

            ),

            ElevatedButton(
                onPressed: () {
                  // UserModel userModelData=UserModel(
                  //     name: namecontroller.text,
                  //     email: emailcontroller.text,
                  //     password: passwordcontroller.text
                  // );
                  FirebaseFirestore.instance.collection("model").add(userModel(
                    password: passwordcontroller.text,
                    email: emailcontroller.text,
                    name: namecontroller.text
                  ).toMap());
                  FirebaseFirestore.instance.collection("model").doc("id").set({
                    "name":namecontroller.text,
                    "email":emailcontroller.text,

                  });
                },
                child: Text("upload"))
          ],
        ),
      ),
    );
  }
}
