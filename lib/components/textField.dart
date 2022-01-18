// ignore_for_file: prefer_collection_literals, unnecessary_new, file_names
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RestaurantTextField extends StatelessWidget {
  String? labelText;
  TextInputType textInputType;
  Function(String value)? onChange;

  // ignore: use_key_in_widget_constructors
  RestaurantTextField(
      {this.labelText = '',
      @required this.onChange,
      this.textInputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        keyboardType: textInputType,
        onChanged: onChange,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 10),
            labelText: labelText,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(
                  width: 20,
                ))),
      ),
    );
  }
}
