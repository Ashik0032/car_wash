import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:car_wash/model/booking_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'main.dart';
import 'order_details.dart';

class recent_orders extends StatefulWidget {
  const recent_orders({super.key});

  @override
  State<recent_orders> createState() => _recent_ordersState();
}

class _recent_ordersState extends State<recent_orders> {
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
                  context,);
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
          "Recent orders",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: width * 0.08,
            color: colorPage.primaryColor,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding:  EdgeInsets.only(
            left: width * 0.05, right: width * 0.05),
        child: Container(
          height: width * 2,
          width: width * 1,
          child: Column(
            children: [
              StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("booking").
                  where("userid",isEqualTo: currentUserid).snapshots().map((snapshots){
                    return snapshots.docs.map((doc){
                      return BookingModel.fromMap(doc.data());
                    }).toList();
                  }),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    List<BookingModel> data=snapshot.data!;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        data.isEmpty?SizedBox():
                        ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: data.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                    orderDetails(
                                      image: data[index].images,
                                      pic_service: data[index].picService,
                                      take_a_date: data[index].takeDate,
                                      pic_slot: data[index].picSlot,
                                      payment_method: data[index].paymentMethod,
                                      // vehicle: '',
                                      // model: '',
                                      // Regnumber: '',
                                      // client: '',
                                      // phoneNumber: '',
                                    ),));
                              },
                              child: Container(
                                height: width * 0.27,
                                width: width * 1,
                                decoration: BoxDecoration(
                                    color: colorPage.secondaryColor,
                                    borderRadius:
                                    BorderRadius.circular(width * 0.015)),
                                margin: EdgeInsets.all(width * 0.015),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(width * 0.025),
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
                                            BorderRadius.circular(width * 0.015)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                            Text("Expected on  04/04/2022",
                                                style: TextStyle(
                                                    fontSize: width * 0.03,
                                                    fontWeight: FontWeight.w600,
                                                    color: colorPage.primaryColor)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Container();
                          },
                        ),
                      ],
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
