import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:trademaza/widgets/common_heading.dart';

import '../../components/fading_sliding_widget.dart';
import '../../model/onboard_page_item.dart';

class OnboardPage extends StatefulWidget {
  final OnboardPageItem onboardPageItem;

  const OnboardPage({super.key, required this.onboardPageItem});

  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<OnboardPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    super.initState();
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
    return Container(
      padding: EdgeInsets.only(
        top: height * 0.22,
        left: width * .1,
        right: width * .1,
      ),
      child: Column(
        children: <Widget>[
          FadingSlidingWidget(
              animationController: _animationController,
              interval: const Interval(0.1, 0.5),
              child: CommonHeading(text: widget.onboardPageItem.headLine)),
          const SizedBox(
            height: 40,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Lottie.asset(
              fit: BoxFit.cover,
              repeat: true,
              animate: true,
              widget.onboardPageItem.lottieAsset,
              controller: _animationController,
              onLoaded: (composition) {
                _animationController
                  ..duration = composition.duration
                  ..forward()
                  ..addListener(() {});
              },
              width: width * 0.9,
            ),
          ),
          SizedBox(height: height * 0.1),
        ],
      ),
    );
  }
}
