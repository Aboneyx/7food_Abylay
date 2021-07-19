import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

final ButtonStyle buttonStyle = ButtonStyle(
    backgroundColor:
        MaterialStateProperty.all<Color>(Color.fromRGBO(71, 83, 109, 1)),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))));
