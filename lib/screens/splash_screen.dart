import 'dart:ui';

import 'package:ecoanexusdemo/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../utils/app_color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                top: size.height * 0.1,
                left: -86,
                child: Container(
                  height: 166,
                  width: 166,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue.withOpacity(0.8)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Color(0xFFE91E63),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.3,
                right: -100,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColor.blueColor),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      'e-coa',
                      style: GoogleFonts.montserratAlternates(
                          color: Colors.white,
                          fontSize: size.width * 0.2,
                          shadows: [
                            Shadow(color: Color(0xFFE91E63), blurRadius: 23),
                            Shadow(color: Color(0xFFE91E63), blurRadius: 23),
                            Shadow(color: AppColor.blueColor, blurRadius: 23),
                          ],
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                        height: size.height * 0.4,
                        child: Lottie.asset('assets/images/uso.json')),
                    SizedBox(
                      height: size.height * 0.07,
                    ),
                    Text(
                      'Get started with our Agent App',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.062),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Center(
                      child: SizedBox(
                        width: size.width * 0.8,
                        child: Text(
                          'Monitor your earnings, leads, deliveries, installations and potential customers',
                          style: TextStyle(color: Colors.white60, fontSize: 12),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage()));
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        child: Center(
                          child: Container(
                            height: 60,
                            width: 60,
                            child: Center(
                              child: Icon(
                                FontAwesomeIcons.arrowRight,
                                size: 30,
                                color: Color(0xFF090017),
                              ),
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
