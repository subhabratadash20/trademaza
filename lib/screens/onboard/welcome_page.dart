import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trademaza/widgets/common_heading.dart';
import 'package:trademaza/widgets/custom_logo.dart';

import '../../components/fading_sliding_widget.dart';
import 'onboard.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1700),
    )..forward();
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Onboard(),
          ));
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            top: height * 0.3,
            child: Column(
              children: <Widget>[
                ScaleTransition(
                  scale: _animationController.drive(
                    Tween<double>(begin: 0.3, end: 1.0).chain(
                      CurveTween(
                        curve: const Interval(0.0, 0.2,
                            curve: Curves.elasticInOut),
                      ),
                    ),
                  ),
                  child: FadeTransition(
                    opacity: _animationController.drive(
                      Tween<double>(begin: 0.0, end: 1.0).chain(
                        CurveTween(
                          curve: const Interval(0.2, 0.4,
                              curve: Curves.decelerate),
                        ),
                      ),
                    ),
                    child: ScaleTransition(
                      scale: _animationController.drive(
                        Tween<double>(begin: 1.3, end: 1.0).chain(
                          CurveTween(
                            curve: const Interval(0.2, 0.4,
                                curve: Curves.elasticInOut),
                          ),
                        ),
                      ),
                      child: const CustomLogo(),
                    ),
                  ),
                ),

                // FadingSlidingWidget(
                //   animationController: _animationController,
                //   interval: const Interval(0.3, 0.9),
                //   child: Text(
                //     'UNLOCK THE\nOPPERTUNITY',
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //       color: const Color.fromARGB(255, 2, 255, 213),
                //       fontSize: width * 0.05,
                //       fontWeight: FontWeight.bold,
                //       // fontFamily: 'ProductbSans',
                //       shadows: const [
                //         Shadow(
                //           offset: Offset(1.0, 1.0),
                //           blurRadius: 3.0,
                //           color: Color.fromARGB(255, 0, 0, 0),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: height * 0.02,
                ),
                FadingSlidingWidget(
                  animationController: _animationController,
                  interval: const Interval(0.3, 0.9),
                  child: const CommonHeading(text: "TradeMaza"),
                ),
                SizedBox(
                  height: height * 0.2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
