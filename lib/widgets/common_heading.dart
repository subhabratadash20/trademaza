import 'package:flutter/material.dart';

class CommonHeading extends StatefulWidget {
  final String text;
  const CommonHeading({super.key, required this.text});

  @override
  State<CommonHeading> createState() => _CommonHeadingState();
}

class _CommonHeadingState extends State<CommonHeading> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              offset: const Offset(1.0, 1.0),
              blurRadius: 3.0,
              color: Theme.of(context).shadowColor,
            ),
          ],
          color: Theme.of(context).secondaryHeaderColor),
    );
  }
}
