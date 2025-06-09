import 'package:flutter/material.dart';

class CustomIcon extends StatefulWidget {
  final void Function()? ontap;
  const CustomIcon({super.key, required this.ontap});

  @override
  State<CustomIcon> createState() => _CustomIconState();
}

class _CustomIconState extends State<CustomIcon> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 5,
        right: 10,
        child: InkWell(
          onTap: widget.ontap,
          child: Icon(
            Icons.heart_broken,
            size: 35,
            color: Colors.redAccent,
          ),
        ));
  }
}
