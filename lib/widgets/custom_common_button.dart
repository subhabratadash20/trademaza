import 'package:flutter/material.dart';

class CustomCommonButton extends StatefulWidget {
  final Color? backGroundColor;
  final Color? fontColor;
  final String buttonName;

  final Widget? icon;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? radius;
  final Function? onTap;

  const CustomCommonButton(
      {super.key,
      this.backGroundColor,
      required this.buttonName,
      this.icon,
      this.height,
      this.width,
      this.onTap,
      this.fontColor,
      this.radius,
      this.fontSize});

  @override
  State<CustomCommonButton> createState() => _CustomCommonButtonState();
}

class _CustomCommonButtonState extends State<CustomCommonButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap != null ? widget.onTap!() : null;
      },
      child: Container(
        padding: const EdgeInsets.all(3),
        height: widget.height ?? 45,
        width: widget.width ?? 100,
        decoration: BoxDecoration(
            color: widget.backGroundColor ?? const Color(0xFF4157FF),
            borderRadius: BorderRadius.circular(widget.radius ?? 12),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 2),
                  color: Theme.of(context).shadowColor,
                  blurRadius: 2,
                  spreadRadius: 0)
            ]),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (widget.icon != null) widget.icon!,
            Text(
              widget.buttonName,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: widget.fontSize ?? 15,
                  color: widget.fontColor ?? Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
