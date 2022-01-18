import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RestaurantButton extends StatelessWidget {
  Function()? onPressed;
  IconData? icon;
  String? value;

  // ignore: use_key_in_widget_constructors
  RestaurantButton({@required this.onPressed, this.icon, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
          onPressed: onPressed,
          child: icon != null ? Icon(icon) : Text(value.toString())),
    );
  }
}
