import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:trademaza/utils/constants.dart';

class CustomCarousalSlider extends StatefulWidget {
  final int? itemCount;
  final double? height;
  const CustomCarousalSlider({super.key, this.itemCount, this.height});

  @override
  State<CustomCarousalSlider> createState() => _CustomCarousalSliderState();
}

class _CustomCarousalSliderState extends State<CustomCarousalSlider> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.itemCount ?? 4,
          options: CarouselOptions(
            height: widget.height ?? 160,
            aspectRatio: 2,
            enlargeFactor: .4,
            autoPlay: true,
            enlargeCenterPage: true,
            // viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return SizedBox(
              height: 120,
              width: width * .8,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(15),
              //   image: DecorationImage(
              //     image: AssetImage(
              //       datar['saved'],
              //     ),
              //     fit: BoxFit.cover,
              //   ),
              // ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/images/saved/saved$index.jpg",
                    fit: BoxFit.cover,
                  )),
            );
          },
        ),
        const SizedBox(
          height: 10,
        ),
        DotsIndicator(
          dotsCount: widget.itemCount ?? 4,
          position: selectedIndex,
          decorator: DotsDecorator(
              activeColor: Constants.defaultBottonColor,
              size: const Size(4, 4)),
        )
      ],
    );
  }
}
