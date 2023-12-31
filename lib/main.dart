import 'package:car_wash/Confirmation.dart';
import 'package:car_wash/Notifications.dart';
import 'package:car_wash/Payment.dart';
import 'package:car_wash/Power_wash.dart';
import 'package:car_wash/Quick_wash.dart';
import 'package:car_wash/Take_a_slot-1.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/order_details.dart';
import 'package:car_wash/profile.dart';
import 'package:car_wash/take_a_slot.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:car_wash/booking.dart';
import 'package:car_wash/location.dart';
import 'package:car_wash/splash.dart';
import 'package:car_wash/login_signup.dart';
import 'package:car_wash/login.dart';
import 'package:car_wash/signup.dart';
import 'package:car_wash/contact number.dart';
import 'package:car_wash/otp.dart';
import 'package:car_wash/on_site.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';
import 'bottom_bar.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(carWash());
}

var width;
var height;

class carWash extends StatelessWidget {
  const carWash({super.key});
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
         FocusManager();
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
