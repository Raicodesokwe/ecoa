import 'dart:ui';

import 'package:ecoanexusdemo/models/home_box.dart';
import 'package:ecoanexusdemo/screens/customer_page.dart';
import 'package:ecoanexusdemo/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../widgets/waiting_modal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fadeAnimation;
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(controller);
    scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 350),
    );
    scaleAnimation =
        CurvedAnimation(parent: scaleController, curve: Curves.elasticInOut);
    Future.delayed(Duration(milliseconds: 600), () {
      controller.forward().then((value) => scaleController.forward());
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    scaleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: FadeTransition(
        opacity: fadeAnimation,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.white),
                            shape: BoxShape.circle),
                        child: SvgPicture.asset(
                          'assets/images/face.svg',
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Welcome, Erick',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          child: Center(
                            child: Icon(
                              FontAwesomeIcons.solidBell,
                              color: Colors.white,
                              size: 17,
                            ),
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white30),
                        ),
                        Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle),
                            ))
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Commission earned this month',
                    style: TextStyle(color: Colors.white60, fontSize: 13),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Kshs 18,120.00',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.keyboard_arrow_up,
                          color: AppColor.blueColor,
                        ),
                        Text(
                          '25.8(0.50%)',
                          style: TextStyle(
                              color: AppColor.blueColor, fontSize: 11),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ScaleTransition(
                  scale: scaleAnimation,
                  child: Row(
                    children: [
                      Container(
                        height: size.height * 0.2,
                        width: size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: [
                            Colors.white.withOpacity(0.5),
                            AppColor.blueColor.withOpacity(0.8),
                            Colors.blue.withOpacity(0.8),
                          ]),
                        ),
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                            child: Container(
                              height: size.height * 0.2,
                              width: size.width * 0.4,
                              color: Colors.black.withOpacity(0.1),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Day',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Kshs 420.00',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.keyboard_arrow_up,
                                          color: AppColor.blueColor,
                                        ),
                                        Text(
                                          '25.8(0.50%)',
                                          style: TextStyle(
                                              color: AppColor.blueColor,
                                              fontSize: 11),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.green.withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: size.height * 0.2,
                        width: size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: [
                            Colors.white.withOpacity(0.5),
                            Colors.red.withOpacity(0.8),
                            Color(0xFFB01EBA).withOpacity(0.8),
                          ]),
                        ),
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                            child: Container(
                              height: size.height * 0.2,
                              width: size.width * 0.4,
                              color: Colors.black.withOpacity(0.1),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Year To Date',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Kshs 212,400.00',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          '12,605.8(1.50%)',
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 11),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.red.withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Quick Actions',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Wrap(
                  children: List.generate(
                      homeBoxList.length,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(seconds: 1),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: GestureDetector(
                                  onTap: () {
                                    homeBoxList[index].label == 'Customers'
                                        ? Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CustomerPage()))
                                        : showDialog(
                                            context: context,
                                            builder: (ctx) {
                                              return WaitingModal();
                                            });
                                  },
                                  child: Card(
                                    elevation: 12,
                                    color: AppColor.lightPurpleColor
                                        .withOpacity(0.1),
                                    child: ListTile(
                                      leading: Container(
                                        height: 30,
                                        width: 30,
                                        child: Icon(
                                          FontAwesomeIcons.bullseye,
                                          color: Color(0xFF090017),
                                          size: 11,
                                        ),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColor.lightPurpleColor),
                                      ),
                                      title: Text(
                                        homeBoxList[index].label,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      subtitle: Text(
                                        homeBoxList[index].number.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.lightPurpleColor),
                                      ),
                                      trailing: Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
