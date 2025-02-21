import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';
import 'package:lady_first_flutter/core/extensions/text_extensions.dart';
import 'package:lady_first_flutter/widgets/image/custom_cached_network_image.dart';

import 'widgets/register_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sign up").startCapitalize,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30.0),
              const CustomCachedNetworkImage(
                imageUrl:
                    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                width: 120.0,
                height: 120.0,
                isCircle: true,
              ),
              const SizedBox(height: 15.0),
              OutlinedButton.icon(
                  onPressed: () {},
                  label: Text("Upload photo").bodyMedium.bold,
                  icon: HugeIcon(
                      icon: HugeIcons.strokeRoundedUpload04,
                      color: AppColor.primaryColor)),
              const SizedBox(height: 30.0),
              const RegisterForm(),
              Row(
                children: [
                  // already have account
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text("Already have account?")
                          .startCapitalize
                          .bodyMedium
                          .bold
                          .primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100.0)
            ],
          ),
        ),
      ),
    );
  }
}
