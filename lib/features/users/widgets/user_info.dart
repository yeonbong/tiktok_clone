import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
    required this.number,
    required this.info,
  }) : super(key: key);

  final String number;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size20,
          ),
        ),
        Gaps.v1,
        Text(info,
            style: TextStyle(
              color: Colors.grey.shade500,
            ))
      ],
    );
  }
}
