import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  bool _isWriting = false;

  final ScrollController _scrollController = ScrollController();

  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  void _stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.7,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          title: const Text("33322 comments"),
          actions: [
            IconButton(
                onPressed: _onClosePressed,
                icon: const FaIcon(FontAwesomeIcons.deleteLeft))
          ],
        ),
        body: GestureDetector(
          onTap: _stopWriting,
          child: Stack(
            children: [
              Scrollbar(
                controller: _scrollController,
                child: ListView.separated(
                  controller: _scrollController,
                  padding: const EdgeInsets.only(
                      top: Sizes.size12,
                      left: Sizes.size12,
                      right: Sizes.size12,
                      bottom: Sizes.size96 + Sizes.size24),
                  separatorBuilder: (context, index) => Gaps.v10,
                  itemCount: 5,
                  itemBuilder: (context, index) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(),
                      Gaps.h14,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  "Gmasfun",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600),
                                ),
                                Gaps.h11,
                                Text("Creator")
                              ],
                            ),
                            const Text(
                              "Here's my comment mynts are sdfasd very long",
                              style: TextStyle(fontSize: Sizes.size20),
                            ),
                            Gaps.v4,
                            const Text(
                              "1-18  Reply",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Gaps.v8,
                            Row(
                              children: const [
                                Text(
                                  "View replies(193)",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Gaps.h3,
                                FaIcon(
                                  FontAwesomeIcons.angleDown,
                                  color: Colors.grey,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Gaps.h16,
                      Column(
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.heart,
                            color: Colors.grey,
                          ),
                          Text(
                            "18.3k",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                width: size.width,
                child: BottomAppBar(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.size14, vertical: Sizes.size11),
                      child: Row(
                        children: [
                          const CircleAvatar(),
                          Gaps.h10,
                          Expanded(
                              child: SizedBox(
                            height: Sizes.size48,
                            child: TextField(
                              onTap: _onStartWriting,
                              minLines: null,
                              maxLines: null,
                              expands: true,
                              textInputAction: TextInputAction.newline,
                              cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: Sizes.size12,
                                    vertical: Sizes.size14),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const FaIcon(
                                        FontAwesomeIcons.at,
                                        color: Colors.black,
                                      ),
                                      Gaps.h10,
                                      const FaIcon(
                                        FontAwesomeIcons.gift,
                                        color: Colors.black,
                                      ),
                                      Gaps.h10,
                                      const FaIcon(
                                        FontAwesomeIcons.faceLaugh,
                                        color: Colors.black,
                                      ),
                                      Gaps.h10,
                                      if (_isWriting)
                                        GestureDetector(
                                            onTap: _stopWriting,
                                            child: const FaIcon(
                                                FontAwesomeIcons.arrowUp)),
                                      Gaps.h2
                                    ],
                                  ),
                                ),
                                hintText: "Add Comment...",
                              ),
                            ),
                          )),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
