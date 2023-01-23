import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const InterestsScreen(),
            ), ((route) {
          return false;
        }));
      }
    }
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
          appBar: AppBar(title: const Text("Login")),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Please write an email";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          if (newValue != null) {
                            formData["email"] = newValue;
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Email",
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor))),
                      ),
                      Gaps.v10,
                      TextFormField(
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Please write an password";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          if (newValue != null) {
                            formData["password"] = newValue;
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Password",
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor))),
                      ),
                      Gaps.v28,
                      GestureDetector(
                        onTap: _onSubmitTap,
                        child: const FormButton(
                          disabled: false,
                          text: "FUCK",
                        ),
                      )
                    ],
                  )))),
    );
  }
}
