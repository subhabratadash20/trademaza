import 'package:flutter/material.dart';
import 'package:trademaza/screens/botton_navigation_screen.dart';
import 'package:trademaza/widgets/common_heading.dart';
import 'package:trademaza/widgets/custom_common_button.dart';
import 'package:trademaza/widgets/custom_logo.dart';

import '../components/fading_sliding_widget.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1700),
    )..forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
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
                  SizedBox(
                    height: height * 0.04,
                  ),
                  FadingSlidingWidget(
                      animationController: _animationController,
                      interval: const Interval(0.1, 0.9),
                      child:
                          const CommonHeading(text: "UNLOCK THE\nOPPORTUNITY")),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  // FadingSlidingWidget(
                  //   animationController: _animationController,
                  //   interval: const Interval(0.3, 0.9),
                  //   child: Text(
                  //     'TradeMaza',
                  //     style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  //           letterSpacing: 3,

                  //           shadows: const [
                  //             Shadow(
                  //               offset: Offset(1.0, 1.0),
                  //               blurRadius: 3.0,
                  //               color: Color.fromARGB(255, 0, 0, 0),
                  //             ),
                  //           ],
                  //           color: Theme.of(context).colorScheme.error,
                  //           fontSize: width * 0.08,
                  //           fontWeight: FontWeight.bold,
                  //           // fontFamily: 'ProductbSans',
                  //         ),
                  //   ),
                  // ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                ],
              ),
              FadingSlidingWidget(
                animationController: _animationController,
                interval: const Interval(0.3, 0.9),
                child: CustomCommonButton(
                  width: 200,
                  backGroundColor: Colors.white,
                  icon: SizedBox(
                    height: 30,
                    child: Image.asset(
                      "assets/icons/google-hangouts.png",
                      scale: 1,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomNavigationScreen(),
                        ));
                  },
                  buttonName: "Sign In With Google",
                  fontColor: const Color(0xFF4157FF),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              FadingSlidingWidget(
                animationController: _animationController,
                interval: const Interval(0.6, 0.9),
                child: CustomCommonButton(
                  width: 200,

                  icon: SizedBox(
                    height: 30,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        "assets/icons/facebook (3) 1.png",
                        scale: 1,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  // onPressed: () {},
                  buttonName: "Sign In With FACEBOOK",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
