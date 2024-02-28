
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../main.dart';



class count_task extends StatefulWidget {
  const count_task({super.key});

  @override
  State<count_task> createState() => _count_taskState();
}

class _count_taskState extends State<count_task> {




  // List all=[
  //   {
  //     "image":'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7LwMvZIDpWs6evGw6p2uol_AQRFjQUg4akA&usqp=CAU',
  //     "name":"broccoli",
  //     "price":22,
  //     "qty":0
  //   },
  //   {
  //     "image":'https://www.shutterstock.com/image-photo/red-tomatto-on-white-background-260nw-1114032455.jpg',
  //     "name":"Tomato",
  //     "price":20,
  //     "qty":0
  //   },
  //   {
  //     "image":'https://4.imimg.com/data4/EV/MV/MY-2/green-cabbage-500x500.jpg',
  //     "name":"Cabbage",
  //     "price":15,
  //     "qty":0
  //   },
  //   {
  //     "image":'https://zagfresh.com/wp-content/uploads/2020/06/lf4.jpg',
  //     "name": "lady Finger",
  //     "price": 25,
  //     "qty":0
  //   },
  //   {
  //     "image":'https://www.bigbasket.com/media/uploads/p/xxl/10000023_15-fresho-baby-potato.jpg',
  //     "name":"Potatto",
  //     "price":30,
  //     "qty":0
  //   }
  // ];
  var total=0;
  var a;
  List page =[];
  // bool slct=false;

  List <QueryDocumentSnapshot<Map<String, dynamic>>>? data;
  addtotal(){
    FirebaseFirestore.instance.collection("count").snapshots().listen((event) {
      data=event.docs;
      total=0;
      for(int i=0;i<event.docs.length;i++){
        total=event.docs[i]["price"]*event.docs[i]["qty"]+total;
        // a = json.decode(data![0].toString());
        // page = a[i];
      }

      // print(page);
      // print("asdfghjkkjhgfdsaasdfghjhgfds*****************************************************");
      setState(() {

      });
    });


  }
  @override
  void initState() {
    addtotal();


    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ListView.separated(
              physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: data!.length,
          itemBuilder: (context, index) {
            return  Container(
              height: width*0.3,
              width: width*1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width*0.03),
                color: Colors.teal,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    offset: Offset(0, 4),
                    spreadRadius: 2,
                    blurRadius: 2,
                  ),],
              ),
              child: ListTile(
                leading:
                Container(
                  height: width*0.3,
                  width: width*0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.03),
                      image: DecorationImage(image: NetworkImage(data![index]['image']),fit: BoxFit.fill)
                  ),
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(data![index]['name'],style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                    ),),
                    Text(data![index]["price"].toString(),style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                    ),)
                  ],
                ),
                trailing: data![index]['qty']!=0?Container(
                  height: width*0.3,
                  width: width*0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.03),
                      color: Colors.white
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(onTap: () {

                        FirebaseFirestore.instance.collection("count").doc(data![index].id).update(
                            {"qty":data![index]["qty"]-1
                            });
                        addtotal();
                        setState(() {
                        });
                      },
                          child: Container(
                              height: width*0.04,
                              width: width*0.04,
                              child:Icon(Icons.remove))),
                      Text(data![index]['qty'].toString(),
                          style: TextStyle(
                              fontSize: width*0.05
                          )),
                      InkWell(onTap: () {
                        FirebaseFirestore.instance.collection("count").doc(data![index].id).update(
                            {"qty":data![index]["qty"]+1
                            });
                        addtotal();
                        setState(() {
                        });
                      },
                          child: Container(
                              height: width*0.05,
                              width: width*0.05,
                              // color: Colors.red,
                              child: Icon(Icons.add)))
                    ],
                  ),
                ):InkWell(
                  onTap: () {
                    //
                    FirebaseFirestore.instance.collection("count").doc(data![index].id).update(
                        {"qty":data![index]["qty"]+1
                        });
                    addtotal();
                    setState(() {

                    });
                  },
                  child: Container(
                    height: width*0.1,
                    width: width*0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.03),
                        color: Colors.white
                    ),
                    child: Center(child: Text("Add Item",style: TextStyle(
                        fontWeight: FontWeight.w700
                    ),)),
                  ),
                ),

              ),
            );
          }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: width*0.03,); },

        )
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: width*0.25,
        width: width*1.3,
        color: Colors.white,
        child: Column(
          children: [
            Divider(
              color: Colors.black,
              endIndent: width * 0.03,
              thickness: width * 0.001,
              indent: width * 0.03,
            ),
            // SizedBox(height: w*0.03),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total:$total',style: TextStyle(
                    fontSize: width*0.08,
                    fontWeight: FontWeight.w700
                ),),
                // SizedBox(width: w*0.03),
                Container(
                  height: width*0.13,
                  width: width*0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width*0.3),
                    color: Colors.teal,
                    boxShadow: [BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      offset: Offset(0, 4),
                      spreadRadius: 2,
                      blurRadius: 2,
                    ),],
                  ),
                  child: Center(child: Text("Order Now",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: width*0.03
                    ),)),
                ),
              ],
            )

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}