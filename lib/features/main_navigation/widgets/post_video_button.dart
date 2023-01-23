import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({
    Key? key,
    required this.inverted,
  }) : super(key: key);

  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Positioned(
        right: 5,
        child: Container(
          height: 35,
          width: 45,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        ),
      ),
      Positioned(
        left: 5,
        child: Container(
          height: 35,
          width: 45,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
            color: !inverted ? Colors.white : Colors.black,
            borderRadius: BorderRadius.circular(10)),
        height: 35,
        width: 45,
        child: Center(
            child: FaIcon(
          FontAwesomeIcons.plus,
          color: !inverted ? Colors.black : Colors.white,
        )),
      ),
    ]);
  }
}
