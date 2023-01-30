import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class Verticaldivider extends StatelessWidget {
  const Verticaldivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      width: Sizes.size32,
      thickness: Sizes.size1,
      color: Colors.grey.shade400,
      indent: Sizes.size14,
      endIndent: Sizes.size14,
    );
  }
}
