import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation_screen.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _showingPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      setState(() {
        _direction = Direction.right;
      });
    } else {
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails detail) {
    if (_direction == Direction.left) {
      setState(() {
        _showingPage = Page.second;
      });
    } else {
      setState(() {
        _showingPage = Page.first;
      });
    }
  }

  void _onEnterAppTap() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const MainNavigationScreen(),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onPanUpdate: _onPanUpdate,
        onPanEnd: _onPanEnd,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
            child: SafeArea(
              child: AnimatedCrossFade(
                  firstChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Gaps.v80,
                        Text(
                          "Watch videos",
                          style: TextStyle(
                              fontSize: Sizes.size44,
                              fontWeight: FontWeight.w700),
                        ),
                        Gaps.v16,
                        Text(
                          "Videos are personalized for you based on what you watch, like and share",
                          style: TextStyle(
                              fontSize: Sizes.size24, color: Colors.black54),
                        )
                      ]),
                  secondChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Gaps.v80,
                        Text(
                          "YOU HUMAN DISGUSTING",
                          style: TextStyle(
                              fontSize: Sizes.size44,
                              fontWeight: FontWeight.w700),
                        ),
                        Gaps.v16,
                        Text(
                          "Videos are personalized for you based on what you watch, like and share",
                          style: TextStyle(
                              fontSize: Sizes.size24, color: Colors.black54),
                        )
                      ]),
                  crossFadeState: _showingPage == Page.first
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 200)),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
              child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: Sizes.size14, horizontal: Sizes.size20),
            child: AnimatedOpacity(
              opacity: _showingPage == Page.first ? 0 : 1,
              duration: const Duration(milliseconds: 200),
              child: CupertinoButton(
                color: Theme.of(context).primaryColor,
                onPressed: _onEnterAppTap,
                child: const Text("Enter the App"),
              ),
            ),
          )),
        ));
  }
}
