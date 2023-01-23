import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class InterestButton extends StatefulWidget {
  const InterestButton({
    Key? key,
    required this.interest,
  }) : super(key: key);

  final String interest;

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  bool _isSelected = false;
  void _onTap() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: const EdgeInsets.symmetric(
            vertical: Sizes.size16, horizontal: Sizes.size12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.1)),
          color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                spreadRadius: 5)
          ],
          borderRadius: BorderRadius.circular(Sizes.size32),
        ),
        child: Text(
          widget.interest,
          style: TextStyle(
              color: _isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
