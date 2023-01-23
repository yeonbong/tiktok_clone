import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  final PageController _pageController = PageController();

  int _itemCount = 3;

  void _onPageChanged(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 3;
    }
    setState(() {});
  }

  void _onVideoFinished() {
    return;
    _pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() {
    return Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 50,
      edgeOffset: 10,
      color: Theme.of(context).primaryColor,
      onRefresh: _onRefresh,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        itemCount: _itemCount,
        itemBuilder: (context, index) => VideoPost(
          onVideoFinished: _onVideoFinished,
          index: index,
        ),
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
