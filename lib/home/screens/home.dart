import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_wash/Add_vehicle.dart';
import 'package:car_wash/Notifications.dart';
import 'package:car_wash/Auth/screen/login.dart';
import 'package:car_wash/Auth/screen/login_signup.dart';
import 'package:car_wash/model/service_model.dart';
import 'package:car_wash/take_a_slot.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:car_wash/Custom_wash.dart';
import 'package:car_wash/Power_wash.dart';
import 'package:car_wash/Prowash.dart';
import 'package:car_wash/service_theme.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';  
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../main.dart';
import '../../model/booking_model.dart';

class home extends StatefulWidget {

  const home({super.key,});


  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int selectIndex = 0;
  bool view =false;


  // List set = [
  //   {"image": imagePage.car6, "text": "Quick wash"},
  //   {"image": imagePage.car7, "text": "Power wash"},
  //   {"image": imagePage.car8, "text": "Pro wash"},
  //   {
  //     "image": imagePage.carservice1,
  //     "text": "Custom wash",
  //   },
  // ];
  // List pages = [
  //   quickWash(),
  //   powerWash(),
  //   proWash(),
  //   customWash(),
  // ];
  bool tap = false;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false
          backgroundColor: colorPage.nineColor,
          floatingActionButton: tap == false
              ? InkWell(
                  onTap: () {
                    tap = true;
                    setState(() {});
                  },
                  child: Container(
                    height: width * 0.11,
                    width: width * 0.26,
                    decoration: BoxDecoration(
                        color: colorPage.primaryColor,
                        borderRadius: BorderRadius.circular(width * 0.1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.add,
                          size: width * 0.08,
                          color: colorPage.secondaryColor,
                        ),
                        Text(
                          "Add",
                          style: TextStyle(
                            fontSize: width * 0.06,
                            fontWeight: FontWeight.w600,
                            color: colorPage.secondaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Stack(children: [
                  Container(
                    height: width * 0.35,
                    width: width * 0.28,
                  ),
                  Container(
                    height: width * 0.25,
                    width: width * 0.28,
                    decoration: BoxDecoration(
                        color: colorPage.primaryColor,
                        // borderRadius: BorderRadius.circular(width*0.02)
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(width * 0.05),
                          bottomRight: Radius.circular(width * 0.05),
                          topRight: Radius.circular(width * 0.02),
                          topLeft: Radius.circular(width * 0.02),
                        )),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: width * 0.02),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => takeaslot(icon: '', servicename: '', page: false,),
                                  ));
                            },
                            child: Container(
                              height: width * 0.075,
                              width: width * 0.22,
                              decoration: BoxDecoration(
                                  color: colorPage.secondaryColor,
                                  borderRadius: BorderRadius.circular(width * 0.1)),
                              child: Center(
                                child: Text("Take a slot",
                                    style: TextStyle(
                                        fontSize: width * 0.038,
                                        fontWeight: FontWeight.w400,
                                        color: colorPage.primaryColor)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: width * 0.0165),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => addVehicle(),
                                  ));
                            },
                            child: Container(
                              height: width * 0.075,
                              width: width * 0.22,
                              decoration: BoxDecoration(
                                  color: colorPage.secondaryColor,
                                  borderRadius: BorderRadius.circular(width * 0.1)),
                              child: Center(
                                child: Text("Add vehicle",
                                    style: TextStyle(
                                        fontSize: width * 0.038,
                                        fontWeight: FontWeight.w400,
                                        color: colorPage.primaryColor)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: width * 0.187,
                      left: width * 0.076,
                      child: CircleAvatar(
                        backgroundColor: colorPage.primaryColor,
                        radius: width * 0.06,
                        child: InkWell(
                          onTap: () {
                            tap = false;
                            setState(() {});
                          },
                          child: CircleAvatar(
                            backgroundColor: colorPage.a19,
                            radius: width * 0.046,
                            child: Icon(CupertinoIcons.multiply,
                                color: colorPage.secondaryColor),
                          ),
                        ),
                      )),
                ]),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: colorPage.secondaryColor,
            leading:
                Icon(Icons.menu, color: colorPage.thirdColor, size: width * 0.08),
            title: Text("Hello: $currentUserName",
                style: TextStyle(
                    fontSize: width*0.07,
                    color: Colors.black,fontWeight: FontWeight.w500)),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => notifications(),));
                },
                child: Icon(
                  Icons.notifications_none,
                  color: colorPage.thirdColor,
                  size: width * 0.08,
                ),
              ),
              SizedBox(
                width: width * 0.03,
              ),
              IconButton(
                  onPressed: () async {
                    GoogleSignIn().signOut();
                    SharedPreferences  _prefes=await SharedPreferences.getInstance() ;
                    _prefes.clear();
                    FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) => login_Signup(),), (route) => false);

                    // Navigator.push(context, CupertinoPageRoute(builder: (context) => login_Signup(),));
                  }, icon: Icon(Icons.logout,color: Colors.black,)),
              SizedBox(
                width: width * 0.03,
              ),
            ],


            // automaticallyImplyLeading: false,
          ),
          drawer: Drawer(),
          body: Padding(
            padding: EdgeInsets.only(
                right: width * 0.05, left: width * 0.05, top: width * 0.05),
            child: Container(
              height: width * 1.9,
              width: width * 1,
              // color: Colors.yellow,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                            hintText: "Search services",
                            hintStyle: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.w400,
                              color: colorPage.sixtColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(width * 0.025),
                                borderSide: BorderSide(
                                  color: colorPage.primaryColor,
                                )),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.025),
                              borderSide: BorderSide(
                                color: colorPage.primaryColor,
                              ),
                            ),
                            suffixIcon: Icon(Icons.search)),
                      ),
                    ),
                    Text("Offers",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: width * 0.058,
                          fontWeight: FontWeight.w600,
                          color: colorPage.primaryColor,
                        )),
                    StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance.collection("banner").doc('images').snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        var data = snapshot.data;
                        List banners = data!['images'];
                        return Column(
                          children: [
                            CarouselSlider.builder(
                              itemCount: banners.length,
                              options: CarouselOptions(
                                height: width * 0.43,
                                onPageChanged: (index, reason) {
                                  selectIndex = index;
                                  setState(() {});
                                },
                                autoPlay: true,
                                autoPlayAnimationDuration: Duration(seconds: 4),
                                viewportFraction: 1,
                              ),
                              itemBuilder:
                                  (BuildContext context, int index, int realIndex) {
                                return Container(
                                  width: width*1,
                                    margin: EdgeInsets.only(right: width * 0.03),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(width * 0.015),
                                        // color: Colors.red,
                                        // image: DecorationImage(
                                        //   image: NetworkImage(banners[index]),fit:BoxFit.cover,
                                        // )
                                    ),
                                  child: ClipRRect(
                                    borderRadius:BorderRadius.circular(width * 0.015) ,
                                      child: CachedNetworkImage(imageUrl: banners[index],fit:BoxFit.cover)),
                                 );
                              },
                            ),
                            SizedBox(height: width*0.02,),
                            Center(
                              child: AnimatedSmoothIndicator(
                                activeIndex: selectIndex,
                                count: banners.length,
                                effect: ExpandingDotsEffect(
                                  activeDotColor: colorPage.primaryColor,
                                  dotColor: colorPage.seventColor,
                                  dotHeight: width * 0.018,
                                  dotWidth: width * 0.025,
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    ),

                    Text("Active request",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: width * 0.058,
                          fontWeight: FontWeight.w600,
                          color: colorPage.primaryColor,
                        )),

                    StreamBuilder(
                        stream: FirebaseFirestore.instance.collection("booking").where("status",isEqualTo: "Accept").
                        where("userid",isEqualTo: currentUserid).snapshots().map((snapshot){
                          return snapshot.docs.map((doc){
                            return BookingModel.fromMap(doc.data());
                          }).toList();
                        }),
                        builder: (context, snapshot) {
                          if(!snapshot.hasData){
                            return Center(child: CircularProgressIndicator(),);
                          }
                          // var data =snapshot.data;
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
                                  return Container(
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
                                                Text("------"),
                                                Image.asset(
                                                  imagePage.circle,
                                                  width: width * 0.025,
                                                ),
                                                SizedBox(
                                                  width: width * 0.01,
                                                ),
                                                Text("Vehicle reached at center",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Service theme",
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
                          child: Container(
                            height: width*0.07,
                            width: width*0.15,
                            child: Center(
                              child: Text("View all",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: width * 0.036,
                                    fontWeight: FontWeight.w500,
                                    color: colorPage.a11,
                                  )),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width*0.01),
                              border: Border.all(
                                color: colorPage.primaryColor
                              )
                            ),
                          ),
                        ),
                      ],
                    ),
                    StreamBuilder(
                      stream: FirebaseFirestore.instance.collection("service").snapshots().map((snapshot){
                        return snapshot.docs.map((doc){
                          return serviceModel.fromMap(doc.data());
                        }).toList();
                      }),
                      builder: (context, snapshot) {
                        if(!snapshot.hasData){
                          return Center(child: CircularProgressIndicator(),);
                        }
                        List<serviceModel> theme=snapshot.data!;

                        // var theme =snapshot.data!.docs;
                        return theme.isEmpty?SizedBox():
                        view!=true?
                        Container(
                          height: width * 0.28,
                          width: width * 1,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                              borderRadius: BorderRadius.circular(width * 0.015)),
                          child:ListView.separated(
                            itemCount: theme.length,
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>Service_Theme(
                                          icon: theme[index].icon!,
                                          name: theme[index].name!,
                                          moto: theme[index].moto!,
                                          description: theme[index].description!,
                                          service: theme[index].service!,
                                          price: theme[index].price!,
                                        ),
                                      ));
                                  setState(() {});
                                },
                                child: Container(
                                  height: width * 0.28,
                                  width: width * 0.25,
                                  decoration: BoxDecoration(
                                      color: colorPage.secondaryColor,
                                      borderRadius:
                                          BorderRadius.circular(width * 0.01)),
                                  margin: EdgeInsets.all(width * 0.015),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: width * 0.015,
                                      ),
                                      Container(
                                          height: width * 0.135,
                                          width: width * 0.135,
                                          child: Image.network(theme[index].icon!)),
                                      Text(theme[index].name!,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: width * 0.041,
                                            fontWeight: FontWeight.w500,
                                            color: colorPage.a11,
                                          )),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                width: width * 0.03,
                              );
                            },
                          ),
                        ):
                        Container(
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>Service_Theme(
                                            icon: theme[index].icon!,
                                            name: theme[index].name!,
                                            moto: theme[index].moto!,
                                            description: theme[index].description!,
                                            service: theme[index].service!,
                                            price: theme[index].price!,
                                          ),
                                        ));
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: width * 0.28,
                                    width: width * 0.25,
                                    decoration: BoxDecoration(
                                        color: colorPage.secondaryColor,
                                        borderRadius:
                                        BorderRadius.circular(width * 0.01)),
                                    margin: EdgeInsets.all(width * 0.015),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          height: width * 0.015,
                                        ),
                                        Container(
                                            height: width * 0.135,
                                            width: width * 0.135,
                                            child: Image.network(theme[index].icon!)),
                                        Text(theme[index].name!,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: width * 0.041,
                                              fontWeight: FontWeight.w500,
                                              color: colorPage.a11,
                                            )),
                                      ],
                                    ),
                                  ),
                                );
                              },),
                        );
                      }
                    ),
                    Text("Our customer feedback",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: width * 0.058,
                          fontWeight: FontWeight.w600,
                          color: colorPage.primaryColor,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width * 0.42,
                          height: width * 0.26,
                          color: colorPage.secondaryColor,
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: width * 0.06,
                                    backgroundImage: AssetImage(imagePage.person),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "John samual",
                                        style: TextStyle(
                                            color: colorPage.primaryColor,
                                            fontSize: width * 0.04,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star,
                                              size: width * 0.05,
                                              color: colorPage.a17),
                                          Icon(Icons.star,
                                              size: width * 0.05,
                                              color: colorPage.a17),
                                          Icon(Icons.star,
                                              size: width * 0.05,
                                              color: colorPage.a17),
                                          Icon(Icons.star,
                                              size: width * 0.05,
                                              color: colorPage.a17),
                                          Icon(Icons.star,
                                              size: width * 0.05,
                                              color: colorPage.a17),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: width * 0.02,
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet\nconsectetur.",
                                style: TextStyle(
                                    fontSize: width * 0.032,
                                    height: width * 0.0028),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: width * 0.42,
                          height: width * 0.26,
                          color: colorPage.secondaryColor,
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: width * 0.06,
                                    backgroundImage: AssetImage(imagePage.person),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "John samual",
                                        style: TextStyle(
                                            color: colorPage.primaryColor,
                                            fontSize: width * 0.04,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star,
                                              size: width * 0.05,
                                              color: colorPage.a17),
                                          Icon(Icons.star,
                                              size: width * 0.05,
                                              color: colorPage.a17),
                                          Icon(Icons.star,
                                              size: width * 0.05,
                                              color: colorPage.a17),
                                          Icon(Icons.star_border,
                                              size: width * 0.05,
                                              color: colorPage.a17),
                                          Icon(Icons.star_border,
                                              size: width * 0.05,
                                              color: colorPage.a17),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: width * 0.02,
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet\nconsectetur.",
                                style: TextStyle(
                                    fontSize: width * 0.032,
                                    height: width * 0.0028),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
  }
}
