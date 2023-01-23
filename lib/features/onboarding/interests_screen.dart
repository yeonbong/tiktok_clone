import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/onboarding/tutorial_screen.dart';
import 'package:tiktok_clone/features/onboarding/widgets/interest_button.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showTitle = false;

  void _onScroll() {
    if (_scrollController.offset > 110) {
      if (_showTitle) return;
      setState(() {
        _showTitle = true;
      });
    } else {
      setState(() {
        _showTitle = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onNextTap() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TutorialScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
            opacity: _showTitle ? 1 : 0,
            duration: const Duration(milliseconds: 100),
            child: const Text("Choose your interests")),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.only(
                left: Sizes.size32, right: Sizes.size32, bottom: Sizes.size20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Choose your Interests",
                style: TextStyle(
                    fontSize: Sizes.size44, fontWeight: FontWeight.w600),
              ),
              Gaps.v24,
              const Text(
                "Get better video recommendations",
                style: TextStyle(fontSize: Sizes.size20, color: Colors.black54),
              ),
              Gaps.v52,
              Wrap(
                runSpacing: 18,
                spacing: 16,
                children: [
                  for (var interest in interests)
                    InterestButton(interest: interest)
                ],
              ),
            ]),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Padding(
              padding: const EdgeInsets.only(
                  bottom: Sizes.size28,
                  top: Sizes.size16,
                  left: Sizes.size20,
                  right: Sizes.size20),
              child: GestureDetector(
                onTap: _onNextTap,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size14,
                  ),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(3)),
                  child: const Text(
                    "Next",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ))),
    );
  }
}
