import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:car_wash/model/booking_model.dart';
import 'package:car_wash/order_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class booking extends StatefulWidget {
  const booking({super.key});

  @override
  State<booking> createState() => _bookingState();
}

class _bookingState extends State<booking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorPage.nineColor,
        appBar: AppBar(
          backgroundColor: colorPage.nineColor,
          title: Text(
            "Bookings",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: width * 0.08,
              color: colorPage.primaryColor,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
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
                    Container(
                      height: width * 0.17,
                      width: width * 1,
                      child: TextFormField(
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
                    ),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("booking")
                            .where("status", isEqualTo: "Accept")
                            .where("userid", isEqualTo: currentUserid)
                            .snapshots().map((snapshot){

                              return snapshot.docs.map((doc){
                                return BookingModel.fromMap(doc.data());
                              }).toList();
                        }),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          List<BookingModel> data=snapshot.data!;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              data.isEmpty
                                  ? SizedBox()
                                  : Text("Currently actived",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: width * 0.058,
                                        fontWeight: FontWeight.w600,
                                        color: colorPage.primaryColor,
                                      )),
                              ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: data.length,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    height: width * 0.27,
                                    width: width * 1,
                                    decoration: BoxDecoration(
                                        color: colorPage.secondaryColor,
                                        borderRadius: BorderRadius.circular(
                                            width * 0.015)),
                                    margin: EdgeInsets.all(width * 0.015),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.all(width * 0.025),
                                          child: Container(
                                            height: width * 0.25,
                                            width: width * 0.23,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        data[index].images),
                                                    fit: BoxFit.cover),
                                                // color: Colors.greenAccent,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        width * 0.015)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(data[index].picService,
                                                style: TextStyle(
                                                  // fontSize:14.36,
                                                  fontSize: width * 0.05,
                                                  fontWeight: FontWeight.w700,
                                                  color: colorPage.primaryColor,
                                                )),
                                            Text(
                                              data[index].serviceVehicle,
                                              style: TextStyle(
                                                  color: colorPage.eigthColor,
                                                  fontWeight: FontWeight.w400,
                                                  height: width * 0.0029,
                                                  fontSize: width * 0.036),
                                            ),
                                            Text(
                                              data[index].takeDate,
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
                                                Text(
                                                    "Vehicle reached at center",
                                                    style: TextStyle(
                                                        fontSize: width * 0.03,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: colorPage
                                                            .primaryColor)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return Container();
                                },
                              ),
                            ],
                          );
                        }),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("booking")
                            .where("userid", isEqualTo: currentUserid)
                            .snapshots().map((snapshot){
                          return snapshot.docs.map((doc){
                            return BookingModel.fromMap(doc.data());
                          }).toList();
                        }),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          List<BookingModel> data1=snapshot.data!;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              data1.isEmpty
                                  ? SizedBox()
                                  : Text("Bookings",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: width * 0.058,
                                        fontWeight: FontWeight.w600,
                                        color: colorPage.primaryColor,
                                      )),
                              ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: data1.length,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (context) => orderDetails(
                                              image: data1[index].images,
                                              pic_service: data1[index].picService,
                                              take_a_date: data1[index].takeDate,
                                              pic_slot: data1[index].picSlot,
                                              payment_method: data1[index].paymentMethod,
                                              // vehicle: "",
                                              // model: '',
                                              // Regnumber: '',
                                              // client: '',
                                              // phoneNumber: "",
                                            ),
                                          ));
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: width * 0.27,
                                      width: width * 1,
                                      decoration: BoxDecoration(
                                          color: colorPage.secondaryColor,
                                          borderRadius: BorderRadius.circular(
                                              width * 0.015)),
                                      margin: EdgeInsets.all(width * 0.015),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.all(width * 0.025),
                                            child: Container(
                                              height: width * 0.25,
                                              width: width * 0.23,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          data1[index].images),
                                                      fit: BoxFit.cover),
                                                  // color: Colors.greenAccent,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          width * 0.015)),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.02,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(data1[index].picService,
                                                  style: TextStyle(
                                                    // fontSize:14.36,
                                                    fontSize: width * 0.05,
                                                    fontWeight: FontWeight.w700,
                                                    color:
                                                        colorPage.primaryColor,
                                                  )),
                                              Text(
                                                data1[index].serviceVehicle,
                                                style: TextStyle(
                                                    color: colorPage.eigthColor,
                                                    fontWeight: FontWeight.w400,
                                                    height: width * 0.0029,
                                                    fontSize: width * 0.036),
                                              ),
                                              Text(
                                                data1[index].takeDate,
                                                style: TextStyle(
                                                    color: colorPage.eigthColor,
                                                    fontWeight: FontWeight.w400,
                                                    height: width * 0.0029,
                                                    fontSize: width * 0.036),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                      "Expected on  04/04/2022",
                                                      style: TextStyle(
                                                          fontSize:
                                                              width * 0.03,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: colorPage
                                                              .primaryColor)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return Container();
                                },
                              ),
                            ],
                          );
                        }),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("booking")
                            .where("status", isEqualTo: "reject")
                            .where("userid", isEqualTo:currentUserid )
                            .snapshots().map((snapshot){
                          return snapshot.docs.map((doc){
                            return BookingModel.fromMap(doc.data());
                          }).toList();
                        }),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          List<BookingModel> data2=snapshot.data!;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              data2.isEmpty
                                  ? SizedBox()
                                  : Text("reject",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: width * 0.058,
                                        fontWeight: FontWeight.w600,
                                        color: colorPage.primaryColor,
                                      )),
                              ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: data2.length,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    height: width * 0.27,
                                    width: width * 1,
                                    decoration: BoxDecoration(
                                        color: colorPage.secondaryColor,
                                        borderRadius: BorderRadius.circular(
                                            width * 0.015)),
                                    margin: EdgeInsets.all(width * 0.015),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.all(width * 0.025),
                                          child: Container(
                                            height: width * 0.25,
                                            width: width * 0.23,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        data2[index].images),
                                                    fit: BoxFit.cover),
                                                // color: Colors.greenAccent,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        width * 0.015)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(data2[index].picService,
                                                style: TextStyle(
                                                  // fontSize:14.36,
                                                  fontSize: width * 0.05,
                                                  fontWeight: FontWeight.w700,
                                                  color: colorPage.primaryColor,
                                                )),
                                            Text(
                                              data2[index].serviceVehicle,
                                              style: TextStyle(
                                                  color: colorPage.eigthColor,
                                                  fontWeight: FontWeight.w400,
                                                  height: width * 0.0029,
                                                  fontSize: width * 0.036),
                                            ),
                                            Text(
                                              data2[index].takeDate,
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
                                                Text(
                                                    "Vehicle reached at center",
                                                    style: TextStyle(
                                                        fontSize: width * 0.03,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: colorPage.a13)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return Container();
                                },
                              ),
                            ],
                          );
                        }),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("booking")
                            .where("status", isEqualTo: "serviced")
                            .where("userid", isEqualTo: currentUserid)
                            .snapshots().map((snapshot){
                          return snapshot.docs.map((doc){
                            return BookingModel.fromMap(doc.data());
                          }).toList();
                        }),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          List<BookingModel>data3=snapshot.data!;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              data3.isEmpty
                                  ? SizedBox()
                                  : Text("Serviced",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: width * 0.058,
                                        fontWeight: FontWeight.w600,
                                        color: colorPage.primaryColor,
                                      )),
                              ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: data3.length,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    height: width * 0.27,
                                    width: width * 1,
                                    decoration: BoxDecoration(
                                        color: colorPage.secondaryColor,
                                        borderRadius: BorderRadius.circular(
                                            width * 0.015)),
                                    margin: EdgeInsets.all(width * 0.015),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.all(width * 0.025),
                                          child: Container(
                                            height: width * 0.25,
                                            width: width * 0.23,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        data3[index].images),
                                                    fit: BoxFit.cover),
                                                // color: Colors.greenAccent,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        width * 0.015)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(data3[index].picService,
                                                style: TextStyle(
                                                  // fontSize:14.36,
                                                  fontSize: width * 0.05,
                                                  fontWeight: FontWeight.w700,
                                                  color: colorPage.primaryColor,
                                                )),
                                            Text(
                                              data3[index].serviceVehicle,
                                              style: TextStyle(
                                                  color: colorPage.eigthColor,
                                                  fontWeight: FontWeight.w400,
                                                  height: width * 0.0029,
                                                  fontSize: width * 0.036),
                                            ),
                                            Text(
                                              data3[index].takeDate,
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
                                                Text(
                                                    "Vehicle dropped successefully",
                                                    style: TextStyle(
                                                        fontSize: width * 0.03,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: colorPage.a13)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return Container();
                                },
                              ),
                            ],
                          );
                        }),
                  ]),
            ),
          ),
        ));
  }
}
