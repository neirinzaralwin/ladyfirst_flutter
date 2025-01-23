import 'package:flutter/material.dart';

import 'widgets/cart_preview_widget.dart';
import 'widgets/checkout_bottom_bar.dart';
import 'widgets/delivery_address_widget.dart';
import 'widgets/saved_payment_method_widget.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      bottomNavigationBar: checkoutBottomBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 15.0),
            DeliveryAddressWidget(),
            SizedBox(height: 15.0),
            SavedPaymentMethodWidget(),
            SizedBox(height: 15.0),
            CartPreviewWidget(),
          ],
        ),
      ),
    );
  }
}
