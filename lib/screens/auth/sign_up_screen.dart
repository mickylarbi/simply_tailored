import 'package:flutter/material.dart';
import 'package:simply_tailored/screens/app_resources.dart';
import 'package:simply_tailored/screens/auth/sign_in_screen.dart';
import 'package:simply_tailored/screens/home/tab_view.dart';
import 'package:simply_tailored/screens/shared/custom_buttons.dart';
import 'package:simply_tailored/screens/shared/custom_text_span.dart';
import 'package:simply_tailored/screens/shared/custom_textformfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              children: [
                Hero(
                  tag: kLogoTag,
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: (kScreenWidth(context) - 96) * 0.8,
                  ),
                ),
                const SizedBox(height: 100),
                const CustomTextFormField(hintText: 'Full Name'),
                const SizedBox(height: 20),
                const CustomTextFormField(hintText: 'Email'),
                const SizedBox(height: 20),
                const PasswordTextFormField(),
                const SizedBox(height: 20),
                const PasswordTextFormField(
                  hintText: 'ConfirmPassword',
                ),
                const SizedBox(height: 50),
                CustomElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TabView()),
                        (route) => false);
                  },
                ),
                const SizedBox(height: 30),
                CustomTextSpan(
                  firstText: "Already have an account?",
                  secondText: 'Sign in',
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInScreen()));
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  children: const [
                    Expanded(child: Divider(height: 40, thickness: 2)),
                    Padding(
                      padding: EdgeInsets.all(24),
                      child: Text('or'),
                    ),
                    Expanded(child: Divider(height: 40, thickness: 2)),
                  ],
                ),
                const SizedBox(height: 30),
                const GoogleButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
