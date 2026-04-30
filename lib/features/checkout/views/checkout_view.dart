import 'package:flutter/material.dart';
import 'package:fruity_app/features/checkout/widgets/checkout_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});
static const routeName = 'checkout';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CheckoutBody(),
    );
  }
}
