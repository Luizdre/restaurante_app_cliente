// ignore_for_file: prefer_collection_literals, unnecessary_new, file_names
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class RestaurantSnackBar extends SnackBar {
  // ignore: prefer_const_constructors, use_key_in_widget_constructors
  RestaurantSnackBar() : super(content: Text(''));

  Widget build(BuildContext context) {
    return const SnackBar(
      content: Text('Falha'),
      duration: Duration(seconds: 1),
      backgroundColor: Colors.redAccent,
    );
  }
}
