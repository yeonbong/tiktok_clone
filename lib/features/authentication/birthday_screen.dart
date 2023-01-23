import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();

  DateTime initialDate = DateTime.now();
  int maxYear = DateTime.now().year - 8;
  final ageLimit = DateTime.utc(
      DateTime.now().year - 8, DateTime.now().month, DateTime.now().day);

  @override
  void initState() {
    super.initState();
    _setTextFieldDate(initialDate);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  void _onNextTap() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const InterestsScreen(),
        ),
        ((route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 300,
            child: CupertinoDatePicker(
              initialDateTime: ageLimit,
              maximumDate: ageLimit,
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: _setTextFieldDate,
            ),
          ),
        ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "When's your birthday?",
                        style: TextStyle(
                            fontSize: Sizes.size20,
                            fontWeight: FontWeight.w700),
                      ),
                      Gaps.v16,
                      Text("Your birthday won't be shown publicly.")
                    ],
                  ),
                  const Icon(
                    Icons.cake,
                    size: Sizes.size96,
                  )
                ],
              ),
              Gaps.v16,
              TextField(
                enabled: false,
                autocorrect: false,
                controller: _birthdayController,
                decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                          child: const FaIcon(FontAwesomeIcons.circleXmark)),
                      Gaps.h16,
                    ],
                  ),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v64,
              GestureDetector(
                onTap: _onNextTap,
                child: const FormButton(
                  text: "Next",
                  disabled: false,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
