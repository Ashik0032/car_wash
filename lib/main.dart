import 'package:car_wash/Confirmation.dart';
import 'package:car_wash/Edit_profile.dart';
import 'package:car_wash/Notifications.dart';
import 'package:car_wash/Payment.dart';
import 'package:car_wash/Power_wash.dart';
import 'package:car_wash/recent_orders.dart';
import 'package:car_wash/service_theme.dart';
import 'package:car_wash/Take_a_slot-1.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/model/model_use_page.dart';
import 'package:car_wash/order_details.dart';
import 'package:car_wash/home/screens/profile.dart';
import 'package:car_wash/take_a_slot.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:car_wash/booking.dart';
import 'package:car_wash/location.dart';
import 'package:car_wash/splash.dart';
import 'package:car_wash/Auth/screen/login_signup.dart';
import 'package:car_wash/Auth/screen/login.dart';
import 'package:car_wash/Auth/screen/signup.dart';
import 'package:car_wash/contact number.dart';
import 'package:car_wash/otp.dart';
import 'package:car_wash/on_site.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

import 'count.dart';
import 'home/screens/home.dart';
import 'bottom_bar.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);


  runApp(carWash());
}

var width;
var height;

String? currentUserName;
String? currentUserEmail;
String? currentUserPassword;
String? currentUserid;
String? currentUserimage;
//
// setSearchParam(String caseNumber) {
//   List<String> caseSearchList = [];
//   String temp = "";
//
//   List<String> nameSplits = caseNumber.split(" ");
//   for (int i = 0; i < nameSplits.length; i++) {
//     String name = "";
//
//     for (int k = i; k < nameSplits.length; k++) {
//       name = name + nameSplits[k] + " ";
//     }
//     temp = "";
//
//     for (int j = 0; j < name.length; j++) {
//       temp = temp + name[j];
//       caseSearchList.add(temp.toUpperCase());
//     }
//   }
//   // print(caseSearchList);
//   return caseSearchList;
// }


class carWash extends StatelessWidget {
  const carWash({super.key});
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
         FocusManager.instance.primaryFocus!.unfocus();
      },
      child: MaterialApp(
        theme: ThemeData(
            textTheme: GoogleFonts.muktaVaaniTextTheme(),
            checkboxTheme: CheckboxThemeData(
              checkColor: MaterialStatePropertyAll(colorPage.nineColor),
            )),
        debugShowCheckedModeBanner: false,
        home: splash(),
      ),
    );
  }
}

















