import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trademaza/screens/onboard/welcome_page.dart';
import 'package:trademaza/utils/constants.dart';
import 'package:trademaza/widgets/custom_common_button.dart';

import '../../components/fading_sliding_widget.dart';
import '../../model/onboard_page_item.dart';
import '../sign_in_screen.dart';
import 'onboard_page.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> with SingleTickerProviderStateMixin {
  List<OnboardPageItem> onboardPageItems = [
    OnboardPageItem(
      headLine: "JOIN TRADERS FORUM",
      lottieAsset: 'assets/animations/DistanceLearning_Discussion.json',
      animationDuration: const Duration(seconds: 2),
    ),
    OnboardPageItem(
      lottieAsset: 'assets/animations/work_from_home.json',
      animationDuration: const Duration(milliseconds: 1100),
      headLine: 'LIVE MARKET TRAINING',
    ),
    OnboardPageItem(
      lottieAsset: 'assets/animations/group_working.json',
      animationDuration: const Duration(seconds: 2),
      headLine: 'DAILY FREE UPDATES',
    ),
  ];

  PageController _pageController = PageController();

  List<Widget> onboardItems = [];
  double? _activeIndex;
  bool onboardPage = false;
  late AnimationController _animationController;
  double radius1 = 0;
  double radius2 = 0;
  double radius3 = 0;

  @override
  void initState() {
    initializePages(); //initialize pages to be shown
    _pageController = PageController();
    _pageController.addListener(() {
      _activeIndex = _pageController.page;
      // debugPrint("Active Index: $_activeIndex");
      if (_activeIndex! >= 1.5 && onboardPage == false) {
        setState(() {
          onboardPage = true;
        });
      } else if (_activeIndex! < 1.5) {
        setState(() {
          onboardPage = false;
        });
      }
    });
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..forward();
    super.initState();
  }

  initializePages() {
    // onboardItems.add(const WelcomePage()); // welcome page
    for (var onboardPageItem in onboardPageItems) {
      //adding onboard pages
      onboardItems.add(OnboardPage(
        onboardPageItem: onboardPageItem,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          PageView(
            onPageChanged: (i) {
              if (i == 2) {
                Timer(const Duration(milliseconds: 100), () {
                  setState(() {
                    radius3 = 80;
                    radius2 = 60;
                    radius1 = 50;
                  });
                });
                Timer((Duration(milliseconds: 1100)), () {});
              } else {
                setState(() {
                  radius3 = 0;
                  radius2 = 0;
                  radius1 = 0;
                });
              }
            },
            controller: _pageController,
            children: onboardItems,
          ),
          Positioned(
            bottom: height * 0.15,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: onboardItems.length,
              effect: WormEffect(
                dotWidth: width * 0.03,
                dotHeight: width * 0.03,
                dotColor: Colors.grey,
                activeDotColor: Constants.defaultBottonColor,
              ),
            ),
          ),
          if (onboardPage) ...[
            Positioned(
              top: 350,
              right: 20,
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: radius1,
                width: radius1,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  "NIFTY",
                  style: TextStyle(
                      color: Theme.of(context).scaffoldBackgroundColor),
                ),
              ),
            ),
            Positioned(
              top: 230,
              left: 35,
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: radius3,
                width: radius3,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  "BANKNIFTY",
                  style: TextStyle(
                      color: Theme.of(context).scaffoldBackgroundColor),
                ),
              ),
            ),
            Positioned(
              top: 490,
              left: 55,
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: radius2,
                width: radius2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "STOCKS",
                  style: TextStyle(
                      color: Theme.of(context).scaffoldBackgroundColor),
                ),
              ),
            ),
          ],
          Positioned(
            right: 20,
            bottom: 20,
            child: FadingSlidingWidget(
                animationController: _animationController,
                child: Row(
                  // mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (!onboardPage)
                      CustomCommonButton(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Mainscreen();
                          }));
                        },
                        buttonName: "Log In",
                        fontColor: Constants.defaultBottonColor,
                        backGroundColor: Colors.white,
                      ),
                    SizedBox(
                      width: width * .3,
                    ),
                    CustomCommonButton(
                      onTap: () {
                        !onboardPage
                            ? _pageController.nextPage(
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeIn)
                            : Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                return const Mainscreen();
                              }));
                      },
                      buttonName: !onboardPage ? "Next" : "Log In",
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
