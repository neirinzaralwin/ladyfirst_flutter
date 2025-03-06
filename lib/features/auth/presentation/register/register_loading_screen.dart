import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';

class RegisterLoadingScreen extends StatelessWidget {
  const RegisterLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CupertinoActivityIndicator(),
            const SizedBox(height: 10.0),
            Text("Registering...").bodyMedium,
          ],
        ),
      ),
    );
  }
}
