import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/birthday_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String _password = "";
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length > 8;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const BirthdayScreen(),
    ));
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
          "Sign up",
        )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v20,
              const Text(
                "Create Password",
                style: TextStyle(
                    fontSize: Sizes.size20, fontWeight: FontWeight.w700),
              ),
              Gaps.v16,
              TextField(
                obscureText: _obscureText,
                onEditingComplete: _onSubmit,
                autocorrect: false,
                controller: _passwordController,
                decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                          onTap: _onClearTap,
                          child: const FaIcon(FontAwesomeIcons.circleXmark)),
                      Gaps.h16,
                      GestureDetector(
                          onTap: _toggleObscureText,
                          child: _obscureText
                              ? const FaIcon(FontAwesomeIcons.eye)
                              : const FaIcon(FontAwesomeIcons.eyeSlash))
                    ],
                  ),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  hintText: "password",
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v16,
              const Text(
                "You password must have:",
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
              ),
              Gaps.v16,
              Row(
                children: [
                  Icon(
                      color: _isPasswordValid() ? Colors.green : Colors.black,
                      Icons.check_circle_outline),
                  Gaps.h3,
                  const Text(
                    "8 to 20 characters",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              Gaps.v64,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                  text: "Next",
                  disabled: !_isPasswordValid(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
