import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/email_screen.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ));
  }

  void _onSingupTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const EmailScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
          child: Column(
            children: [
              Gaps.v60,
              const Text(
                "Sign up for TikTok",
                style: TextStyle(
                    fontSize: Sizes.size36, fontWeight: FontWeight.w700),
              ),
              Gaps.v14,
              const Text(
                "Create a profile, other accounts, make your own videos, and more.",
                textAlign: TextAlign.center,
              ),
              Gaps.v14,
              GestureDetector(
                onTap: () => _onSingupTap(context),
                child: const AuthButton(
                    icon: FaIcon(FontAwesomeIcons.user),
                    text: "Use email & password"),
              ),
              const AuthButton(
                  icon: FaIcon(FontAwesomeIcons.facebook),
                  text: "Continue with Facebook"),
              const AuthButton(
                  icon: FaIcon(FontAwesomeIcons.apple),
                  text: "Continue with Apple"),
              const AuthButton(
                  icon: FaIcon(FontAwesomeIcons.google),
                  text: "Continue with Google"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 1,
          color: Colors.grey.shade100,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.size20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                Gaps.h5,
                GestureDetector(
                  onTap: () => _onLoginTap(context),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
