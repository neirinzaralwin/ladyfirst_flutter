import 'package:flutter/material.dart';
import 'widgets/amount_summary.dart';
import 'widgets/cart_bottom_bar.dart';
import 'widgets/cart_item_list.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final double imageWidth = 150.0;
  final double horizontalPadding = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      bottomNavigationBar: cartBottomBar(),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 10.0),
        child: Column(
          children: [
            CartItemList(),
            AmountSummary(),
          ],
        ),
      ),
    );
  }
}
