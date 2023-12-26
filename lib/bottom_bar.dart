import 'package:car_wash/color_page.dart';
import 'package:car_wash/home.dart';
import 'package:car_wash/on_site.dart';
import 'package:car_wash/otp.dart';
import 'package:car_wash/profile.dart';
import 'package:car_wash/signup.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'package:motion_tab_bar_v2/motion-tab-item.dart';

import 'booking.dart';
import 'main.dart';

class bottom_bar extends StatefulWidget {
  const bottom_bar({super.key});

  @override
  State<bottom_bar> createState() => _bottom_barState();
}

class _bottom_barState extends State<bottom_bar>
    with SingleTickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;
  int selectIndex = 0;
  List abc = [
    home(),
    booking(),
    profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: abc[selectIndex],
        bottomNavigationBar: ConvexAppBar(
          elevation: 0,
          style: TabStyle.reactCircle,
          activeColor: colorPage.primaryColor,
          backgroundColor: colorPage.secondaryColor,
          height: width * 0.14,
          color: colorPage.a12,
          // curveSize: width*0.2,
          items: [
            TabItem(
              icon: Icons.home_outlined,
              title: "Home",
              activeIcon: Icons.home,
            ),
            TabItem(
              icon: Icons.check_circle_outline,
              title: "Booked",
              activeIcon: Icons.check_circle,
            ),
            TabItem(
              icon: Icons.person_outline,
              title: "Profile",
              activeIcon: Icons.person,
            ),
          ],
          initialActiveIndex: selectIndex,
          onTap: (index) {
            setState(() {
              selectIndex = index;
            });
          },
        ));
  }
}
