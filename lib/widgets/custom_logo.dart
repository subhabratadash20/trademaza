import 'package:flutter/material.dart';

class CustomLogo extends StatefulWidget {
  const CustomLogo({super.key});

  @override
  State<CustomLogo> createState() => _CustomLogoState();
}

class _CustomLogoState extends State<CustomLogo> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    // double height = MediaQuery.sizeOf(context).height;
    return Container(
      width: width * 0.45,
      height: width * 0.45,
      decoration: ShapeDecoration(
        color: const Color(0xFFFFFFFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(width * 0.08),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/images/OIG.jpg',
          scale: 1,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
