import 'package:flutter/material.dart';

void buildErrorBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(

      //backgroundColor: Colors.red,
        content: Text(message)),
  );
}
