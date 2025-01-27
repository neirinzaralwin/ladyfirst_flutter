import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/dimension/screen_dimension.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';
import 'package:lottie/lottie.dart';

class OrderPlaceScreen extends StatefulWidget {
  const OrderPlaceScreen({super.key});

  @override
  State<OrderPlaceScreen> createState() => _OrderPlaceScreenState();
}

class _OrderPlaceScreenState extends State<OrderPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomAppBar(),
      body: Stack(
        children: [
          Positioned.fill(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/icons/package_delivery.png',
                  height: 200, fit: BoxFit.cover),
              const SizedBox(height: 50.0),
              Text("Order has been placed").headSmall.bold,
            ],
          )),
          ConfetiWidget()
        ],
      ),
    );
  }

  _buildBottomAppBar() {
    return BottomAppBar(
      height: 80.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.popUntil(context, (route) => route.isFirst),
                    child: Text("Back to home"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ConfetiWidget extends StatelessWidget {
  const ConfetiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Lottie.asset(
        'assets/lotties/confeti.json',
        repeat: false,
        width: ScreenDimension.getWidth(context),
        height: ScreenDimension.getHeight(context),
        fit: BoxFit.cover,
      ),
    );
  }
}
