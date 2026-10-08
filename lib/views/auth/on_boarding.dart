import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/logic/helper_methods.dart';
import 'package:flutter_application_2/views/auth/login.dart';

class OnBoardingView extends StatefulWidget {
  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final images = [
    "assets/images/on_boarding1.jpg",
    "assets/images/on_boarding2.jpg",
    "assets/images/on_boarding3.jpg",
  ];

  final texts = [
    "Move Every shipment",
    "Track in Real-Time",
    "Track in Real-Time",
  ];

  final subTitle = ["With Confidence", "Stay in Control", "Stay in Control"];

  int currentPage = 0;

  final Controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          PageView(
            controller: Controller,
            onPageChanged: (value) {
              currentPage = value;
              setState(() {});
            },
            children: [
              Image.asset(
                "assets/images/on_boarding1.jpg",
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Image.asset(
                "assets/images/on_boarding2.jpg",
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Image.asset(
                "assets/images/on_boarding3.jpg",
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ],
          ),
          IgnorePointer(
            ignoring: true,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withValues(alpha: 0), Colors.black],
                  begin: Alignment(0, -.1),
                  end: Alignment(0, 1),
                ),
              ),
            ),
          ),

          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    images.length,
                    (index) => Padding(
                      padding: EdgeInsetsDirectional.only(
                        end: index == images.length - 1 ? 0 : 34,
                      ),
                      child: Transform.rotate(
                        angle: index == currentPage ? pi / 4 : 0,
                        child: Container(
                          height: 9,
                          width: 9,
                          decoration: BoxDecoration(
                            color: index == currentPage
                                ? Colors.white
                                : Colors.transparent,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 23.27),
                Text(
                  texts[currentPage],
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  subTitle[currentPage],
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 24),
                PhysicalModel(
                  color: Colors.white.withValues(alpha: .10),
                  elevation: 8,
                  shadowColor: Colors.black.withValues(alpha: .25),
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: EdgeInsets.all(9),
                    child: FloatingActionButton(
                      onPressed: () {
                        if (currentPage == images.length - 1) {
                          goTo(page: LoginView(), keepHistory: false);
                        } else {
                          currentPage++;
                          Controller.animateToPage(
                            currentPage,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.linear,
                          );
                          setState(() {});
                        }
                      },
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(Icons.arrow_forward_ios, color: Colors.white),
                      backgroundColor: Color(0xff2563EB),
                    ),
                  ),
                ),
                SizedBox(height: 48),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
