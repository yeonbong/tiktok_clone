import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/videos/widgets/video_button.dart';
import 'package:tiktok_clone/features/videos/widgets/video_comments.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;
  final int index;
  const VideoPost(
      {super.key, required this.onVideoFinished, required this.index});

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/videos/video.mp4");

  late final AnimationController _animationController;

  bool isPaused = false;

  bool seeMore = false;

  void _onVideoChange() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.duration ==
          _videoPlayerController.value.position) {
        widget.onVideoFinished();
      }
    }
  }

  void _initVideoPlayer() async {
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    _videoPlayerController.addListener(_onVideoChange);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
    _animationController = AnimationController(
        vsync: this,
        value: 2,
        upperBound: 2,
        lowerBound: 1.0,
        duration: const Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 &&
        !isPaused &&
        !_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }
    if (_videoPlayerController.value.isPlaying && info.visibleFraction == 0) {
      _onTogglePause();
    }
  }

  void _onTogglePause() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }
    setState(() {
      isPaused = !isPaused;
    });
  }

  void _onCommentsTap(BuildContext context) async {
    if (_videoPlayerController.value.isPlaying) {
      _onTogglePause();
    }
    await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => const VideoComments());
    _onTogglePause();
  }

  void _onSeemoreTap() {
    setState(() {
      seeMore = !seeMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
              child: _videoPlayerController.value.isInitialized
                  ? VideoPlayer(_videoPlayerController)
                  : Container(
                      color: Colors.black,
                    )),
          Positioned.fill(
              child: GestureDetector(
            onTap: _onTogglePause,
          )),
          Positioned.fill(
              child: IgnorePointer(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animationController.value,
                  child: child,
                );
              },
              child: AnimatedOpacity(
                opacity: isPaused ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: const Icon(
                  Icons.play_circle,
                  size: Sizes.size96,
                ),
              ),
            ),
          )),
          Positioned(
            left: 20,
            bottom: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "@data",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: Sizes.size28,
                      fontWeight: FontWeight.bold),
                ),
                Gaps.v24,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          "This is actually the place, and I'm going to write very long text to try my ability thank you thank youthank youthank youthank youthank you",
                          maxLines: seeMore ? null : 2,
                          overflow: seeMore
                              ? TextOverflow.clip
                              : TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                          onTap: _onSeemoreTap,
                          child: Text(seeMore ? "" : "See more"))
                    ],
                  ),
                ),
                Gaps.h10,
              ],
            ),
          ),
          Positioned(
              right: 10,
              bottom: 10,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    foregroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/109797725?v=4"),
                    child: Text(
                      "data",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Gaps.v32,
                  const VideoButton(
                    icon: FontAwesomeIcons.solidHeart,
                    text: "2.9M",
                  ),
                  Gaps.v32,
                  GestureDetector(
                    onTap: () => _onCommentsTap(context),
                    child: const VideoButton(
                      icon: FontAwesomeIcons.solidCommentDots,
                      text: "30.3K",
                    ),
                  ),
                  Gaps.v32,
                  const VideoButton(
                    icon: FontAwesomeIcons.solidShareFromSquare,
                    text: "",
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
