import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  void _onTapTapped(int value) {
    FocusScope.of(context).unfocus();
  }

  String search = "";

  bool _isSearching = false;

  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onStartSearching() {
    setState(() {
      _isSearching = true;
    });
  }

  void _onDeleteTap() {
    setState(() {
      _textEditingController.clear();
      _isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 1,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const FaIcon(
                  FontAwesomeIcons.angleLeft,
                  size: Sizes.size36,
                ),
                Gaps.h12,
                Expanded(
                  child: SizedBox(
                    height: Sizes.size48,
                    child: TextField(
                      onTap: _onStartSearching,
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: Sizes.size12),
                        hintText: "Search",
                        prefixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Gaps.h4,
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: FaIcon(
                                FontAwesomeIcons.magnifyingGlass,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (_isSearching)
                              GestureDetector(
                                onTap: _onDeleteTap,
                                child: const FaIcon(
                                  FontAwesomeIcons.solidCircleXmark,
                                  color: Colors.grey,
                                ),
                              ),
                          ],
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      cursorColor: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Gaps.h12,
                const FaIcon(
                  FontAwesomeIcons.alignJustify,
                  size: Sizes.size28,
                )
              ],
            ),
          ),
          bottom: TabBar(
              onTap: _onTapTapped,
              splashFactory: NoSplash.splashFactory,
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size12),
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.black,
              labelStyle: const TextStyle(
                  fontSize: Sizes.size20, fontWeight: FontWeight.w500),
              indicatorColor: Colors.black,
              isScrollable: true,
              tabs: [
                for (var tab in tabs)
                  Tab(
                    text: tab,
                  ),
              ]),
        ),
        body: TabBarView(children: [
          GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: Sizes.size10,
                  crossAxisSpacing: Sizes.size10,
                  childAspectRatio: 9 / 20,
                  crossAxisCount: 2),
              itemBuilder: (context, index) => Column(
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1)),
                        child: AspectRatio(
                            aspectRatio: 9 / 16,
                            child: FadeInImage.assetNetwork(
                                fit: BoxFit.fill,
                                placeholder: "assets/images/placeholder.jpg",
                                image:
                                    "https://images.unsplash.com/photo-1661956600655-e772b2b97db4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80")),
                      ),
                      Gaps.v10,
                      const Text(
                        "Cajun chicken Alfredo #cooking #coooking # cokcickcn sotp sotti ti",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Gaps.v8,
                      DefaultTextStyle(
                        style: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w600),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            CircleAvatar(
                              radius: 13,
                            ),
                            Gaps.h4,
                            Expanded(
                              child: Text(
                                "Thie sis also longl gon logng long",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            FaIcon(
                              FontAwesomeIcons.heart,
                              color: Colors.grey,
                              size: Sizes.size16,
                            ),
                            Gaps.h3,
                            Text(
                              "2.0M",
                            )
                          ],
                        ),
                      )
                    ],
                  )),
          for (var tab in tabs.skip(1))
            Center(
              child: Text(tab),
            )
        ]),
      ),
    );
  }
}
