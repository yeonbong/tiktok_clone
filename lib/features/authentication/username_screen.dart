import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/email_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController _usernameController = TextEditingController();
  String _username = "";

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onNextTap() {
    if (_username.isEmpty) return;
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const EmailScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "Create Username",
              style: TextStyle(
                  fontSize: Sizes.size20, fontWeight: FontWeight.w700),
            ),
            Gaps.v12,
            const Text(
              "You can always change this later.",
              style: TextStyle(color: Colors.black26),
            ),
            Gaps.v16,
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  hintText: "Username"),
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v16,
            GestureDetector(
              onTap: _onNextTap,
              child: FormButton(
                text: "Next",
                disabled: _username.isEmpty,
              ),
            )
          ],
        ),
      ),
    );
  }
}
