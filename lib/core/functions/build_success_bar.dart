import 'package:flutter/material.dart';

void buildSuccessBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Signup Successful!')),
  );
}
