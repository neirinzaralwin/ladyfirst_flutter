import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/constants/app_pages.dart';
import 'package:lady_first_flutter/core/constants/routes.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({super.key});

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolledToBottom = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _isScrolledToBottom = true;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => AppPages.router.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Terms and Conditions").largeTitle.bold,
                  const Text('''
1. Introduction
Welcome to Lady First. By using our service, you agree to these terms and conditions.

2. User Agreement
By accessing and using this application, you accept and agree to be bound by the terms and provisions of this agreement.

3. Privacy Policy
We respect your privacy and are committed to protecting your personal information. Please review our Privacy Policy.

4. User Responsibilities
Users must:
- Provide accurate information
- Maintain account security
- Comply with all applicable laws
- Respect other users

5. Intellectual Property
All content, trademarks, and intellectual property rights are owned by Lady First.

6. Limitation of Liability
We shall not be liable for any indirect, incidental, special, consequential, or punitive damages.

7. Changes to Terms
We reserve the right to modify these terms at any time. Continued use of the service constitutes acceptance of modified terms.

8. Termination
We may terminate or suspend access to our service immediately, without prior notice.

9. Governing Law
These terms shall be governed by and construed in accordance with the laws.

10. Contact Information
For any questions about these Terms, please contact us.
                ''', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
            child: ElevatedButton(
              onPressed:
                  _isScrolledToBottom
                      ? () {
                        AppPages.router.pushReplacementNamed(Routes.register);
                      }
                      : null,
              child: const Text('Accept Terms'),
            ),
          ),
        ],
      ),
    );
  }
}
