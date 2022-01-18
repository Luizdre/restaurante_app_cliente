// ignore_for_file: prefer_collection_literals, unnecessary_new, file_names
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
RestaurantBottomSheet(BuildContext context, Widget content) {
  return showModalBottomSheet(
      isScrollControlled: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: (context),
      builder: (context) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: content,
          ));
}
