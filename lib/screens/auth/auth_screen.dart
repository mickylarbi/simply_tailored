import 'package:flutter/material.dart';
import 'package:simply_tailored/screens/app_resources.dart';
import 'package:simply_tailored/screens/auth/sign_in_screen.dart';
import 'package:simply_tailored/screens/shared/custom_buttons.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: firebase condition
    return const AuthScreen();
  }
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
              CustomElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()));
                },
              ),
              const SizedBox(height: 70),
              const GoogleButton(),
              const SizedBox(height: 50),
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
              const SizedBox(height: 50),
              const CustomTextButton(),
            ],
          ),
        ),
      ),
    );
  }
}
