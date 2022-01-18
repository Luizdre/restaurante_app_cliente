import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RestaurantText extends StatelessWidget {
  String? value;
  Color? fontColor;
  double? fontSize;
  // ignore: use_key_in_widget_constructors
  RestaurantText(
      {@required this.value,
      this.fontColor = Colors.black,
      this.fontSize = 25});
  @override
  Widget build(BuildContext context) {
    return Text(
      value!,
      style: TextStyle(fontSize: fontSize, color: fontColor),
    );
  }
}
