import 'dart:io';

import 'package:car_wash/Add_vehicle.dart';
import 'package:car_wash/Take_a_slot-1.dart';
import 'package:car_wash/booking.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:car_wash/Auth/screen/login.dart';
import 'package:car_wash/model/booking_model.dart';
import 'package:car_wash/model/service_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'Custom_wash.dart';
import 'home/screens/home.dart';
import 'main.dart';

class takeaslot extends StatefulWidget {
  final String icon;
  final String servicename;
  final bool page;
  const takeaslot({super.key, required this.icon, required this.servicename, required this.page});

  @override
  State<takeaslot> createState() => _takeaslotState();
}

class _takeaslotState extends State<takeaslot> {
  String? selectedVehicle;

  String imageurl =
      "https://img.freepik.com/free-vector/concept-image-upload-landing-page_23-2148319404.jpg?w=996&t=st=1707117272~exp=1707117872~hmac=a2d92e27f62a5aab9f32c36cfdad62f2c6a577ad02fd5f5a35660551884c8d91";
  // var listItem = ["Car-M5-KL-53 SG 4357", "Car-ShiftM5-KL-10 AB 4357"];

  bool loading = false;

  // List set = [
  //   {
  //     "image": imagePage.car6,
  //     "text": "Quick wash",
  //   },
  //   {"image": imagePage.car7, "text": "Power wash"},
  //   {"image": imagePage.car8, "text": "Pro wash"},
  //   {
  //     "image": imagePage.carservice1,
  //     "text": "Custom wash",
  //   },
  // ];
  List tap1 = ["On site", "Self visit", "Pic up  and drop"];

  int selectedOption = 0;
  int tap = 0;

  bool view=false;

  var file;
  pickFile(ImageSource) async {
    final imageFile = await ImagePicker.platform.pickImage(source: ImageSource);
    file = File(imageFile!.path);
    if (mounted) {
      setState(() {
        file = File(imageFile.path);
      });
    }
    uploadFile();
  }

  uploadFile() async {
    setState(() {
      loading = true;
    });

    if (file != null) {
      var uploadTask = await FirebaseStorage.instance
          .ref("images")
          .child("${DateTime.now()}")
          .putFile(file!, SettableMetadata(contentType: 'image/jpeg'));
      imageurl = await uploadTask.ref.getDownloadURL();
    }
    setState(() {
      loading = false;
    });
  }

  var themename;
  @override
  void initState() {
    
    // themename;
    // TODO: implement initState
    super.initState();
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
            child: Container(
                height: width * 2.33,
                width: width * 1,
                child: SingleChildScrollView(
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
                        child: StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("carwash")
                                .doc(currentUserid)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              var data = snapshot.data;
                              Map<String, dynamic> DataMap =
                                  data?.data() as Map<String, dynamic>;
                              List vehicles = DataMap['vehicles'];
                              return Column(
                                children: [
                                  // Text(DataMap['vehicles'][0]["Reg.number"].toString()),
                                  Container(
                                    height: width * 0.16,
                                    width: width * 0.85,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: colorPage.primaryColor,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(width * 0.03),
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
                                      value: selectedVehicle,
                                      onChanged: (newValue) {
                                        setState(() {
                                          selectedVehicle = newValue.toString();
                                        });
                                      },
                                      items: vehicles.map((valueItem) {
                                        return DropdownMenuItem(
                                          value: valueItem["vehicle"] +
                                              "-" +
                                              valueItem['model'] +
                                              "\n" +
                                              valueItem['Reg.number'],
                                          child: Text(
                                              valueItem["vehicle"] +
                                                  "-" +
                                                  valueItem['model'] +
                                                  "-" +
                                                  valueItem['Reg.number'],
                                              style: TextStyle(
                                                  fontSize: width * 0.045)),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              );
                            }),
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

                            if (imageurl != "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Image added")));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Image Not added")));
                            }

                          },
                          child: Container(
                            height: width * 0.52,
                            width: width * 0.9,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(width * 0.01),
                                border: Border.all(color: colorPage.a20)),
                            child: Center(
                              child: loading
                                  ? CircularProgressIndicator()
                                  : Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(imageurl),
                                              fit: BoxFit.cover)),
                                    ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: width * 0.02,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            // uploadFile();
                            if (imageurl != "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Image added")));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Image Not added")));
                            }

                            // uploadFile();
                            setState(() {});
                          },
                          child: Container(
                            height: width * 0.1,
                            width: width * 0.3,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: colorPage.primaryColor),
                                borderRadius:
                                    BorderRadius.circular(width * 0.1)),
                            child: Center(
                              child: Text("save image",
                                  style: TextStyle(
                                      fontSize: width * 0.04,
                                      color: colorPage.primaryColor,
                                      fontWeight: FontWeight.w600)),
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
                          InkWell(
                            onTap: () {
                              view=!view;
                              setState(() {

                              });
                            },
                            child: Text("View all",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: width * 0.036,
                                  fontWeight: FontWeight.w500,
                                  color: colorPage.tenColor,
                                )),
                          ),
                        ],
                      ),
                      StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("service")
                              .snapshots().map((snapshots){
                                return snapshots.docs.map((doc){
                                  return serviceModel.fromMap(doc.data()!);
                                }).toList();
                          }),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            List<serviceModel> theme=snapshot.data!;

                            return widget.page==true?Container(
                              height: width * 0.28,
                              width: width * 1,
                              decoration: BoxDecoration(
                                  // color: colorPage.secondaryColor,
                                  borderRadius:
                                  BorderRadius.circular(width * 0.015)),
                              child: ListView.separated(
                                itemCount:1,
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {

                                  return InkWell(
                                    onTap: () {
                                      selectedOption = index;
                                      themename = widget.servicename;
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
                                              color:
                                              colorPage.secondaryColor),
                                          borderRadius: BorderRadius.circular(
                                              width * 0.01)),
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
                                              child: Image.network(
                                                  widget.icon!)),
                                          Text(widget.servicename!,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontSize: width * 0.042,
                                                fontWeight: FontWeight.w500,
                                                color: colorPage.a11,
                                              )),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    width: width * 0.03,
                                  );
                                },
                              ),
                            ): view!=true?  Container(
                              height: width * 0.28,
                              width: width * 1,
                              decoration: BoxDecoration(
                                // color: colorPage.secondaryColor,
                                  borderRadius:
                                  BorderRadius.circular(width * 0.015)),
                              child: ListView.separated(
                                itemCount: theme.length,
                                scrollDirection: Axis.horizontal,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {

                                  return InkWell(
                                    onTap: () {
                                      selectedOption = index;
                                      themename = theme[index].name;
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
                                              color:
                                              colorPage.secondaryColor),
                                          borderRadius: BorderRadius.circular(
                                              width * 0.01)),
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
                                              child: Image.network(
                                                  theme[index].icon!)),
                                          Text(theme[index].name!,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontSize: width * 0.042,
                                                fontWeight: FontWeight.w500,
                                                color: colorPage.a11,
                                              )),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    width: width * 0.03,
                                  );
                                },
                              ),
                            ): Container(
                              height: width * 0.6,
                              width: width * 1,
                              // color: Colors.red,
                              child: GridView.builder(
                                itemCount: theme.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: width * 0.03,
                                  mainAxisSpacing: width * 0.025,
                                  childAspectRatio: 1,
                                ),
                                // physics: ClampingScrollPhysics(),
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      selectedOption = index;
                                      themename = theme[index].name;
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
                                              color:
                                              colorPage.secondaryColor),
                                          borderRadius: BorderRadius.circular(
                                              width * 0.01)),
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
                                              child: Image.network(
                                                  theme[index].icon!)),
                                          Text(theme[index].name!,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontSize: width * 0.042,
                                                fontWeight: FontWeight.w500,
                                                color: colorPage.a11,
                                              )),
                                        ],
                                      ),
                                    ),
                                  );
                                },),
                            );
                          }),
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
                            if(widget.page==true){
                              themename=widget.servicename;
                            }
                            if (selectedVehicle != null && imageurl != "") {
                              BookingModel bookingModel = BookingModel(
                                  images: imageurl,
                                  picService: themename.toString(),
                                  picYourComfort: tap1[tap],
                                  serviceVehicle: selectedVehicle.toString(),
                                 userid: currentUserid.toString(),
                                  addYourLocation: '',
                                  addYourNote: '',
                                  paymentMethod: '',
                                  picSlot: '',
                                  takeDate: "25/11/2024",
                                status: '',
                                id: '',

                              );

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => booking_1(bookingModel: bookingModel,
                                    ),
                                  ));
                            } else {
                              selectedVehicle == null
                                  ? ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "choose your service vehicle!")))
                                  : ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text("add your vehicle image")));
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
                      ),
                    ],
                  ),
                ))));
  }
}

// padding:  EdgeInsets.only(right: width*0.025,left: width*0.025,bottom: width*0.025,top: width*0.01),
// ),
