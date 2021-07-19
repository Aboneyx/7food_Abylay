import 'package:flutter/material.dart';

class CustomElevation extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  CustomElevation({required this.child, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(this.height / 2)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: height / 3,
            offset: Offset(0, -height / 5),
          ),
        ],
      ),
      child: this.child,
    );
  }
}