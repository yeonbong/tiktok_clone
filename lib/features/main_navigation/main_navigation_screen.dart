import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/discover/discover_screen.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/post_video_button.dart';
import 'package:tiktok_clone/features/videos/video_timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 1;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text("data"),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _selectedIndex == 0 ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Offstage(
              offstage: _selectedIndex != 0,
              child: const VideoTimelineScreen()),
          Offstage(
              offstage: _selectedIndex != 1, child: const DiscoverScreen()),
          Offstage(offstage: _selectedIndex != 3, child: Container()),
          Offstage(offstage: _selectedIndex != 4, child: Container()),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: _selectedIndex == 0 ? Colors.black : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavTap(
                text: "Home",
                selectedIcon: FontAwesomeIcons.house,
                icon: FontAwesomeIcons.house,
                isSelected: _selectedIndex == 0,
                onTap: () {
                  return _onTap(0);
                },
                selectedIndex: _selectedIndex,
              ),
              NavTap(
                selectedIcon: FontAwesomeIcons.solidCompass,
                text: "Discover",
                icon: FontAwesomeIcons.compass,
                isSelected: _selectedIndex == 1,
                onTap: () {
                  return _onTap(1);
                },
                selectedIndex: _selectedIndex,
              ),
              Gaps.h24,
              GestureDetector(
                  onTap: _onPostVideoButtonTap,
                  child: PostVideoButton(inverted: _selectedIndex != 0)),
              Gaps.h24,
              NavTap(
                selectedIcon: FontAwesomeIcons.solidComment,
                text: "Inbox",
                icon: FontAwesomeIcons.comment,
                isSelected: _selectedIndex == 3,
                onTap: () {
                  return _onTap(3);
                },
                selectedIndex: _selectedIndex,
              ),
              NavTap(
                selectedIcon: FontAwesomeIcons.solidUser,
                text: "Profile",
                icon: FontAwesomeIcons.user,
                isSelected: _selectedIndex == 4,
                onTap: () {
                  return _onTap(4);
                },
                selectedIndex: _selectedIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
