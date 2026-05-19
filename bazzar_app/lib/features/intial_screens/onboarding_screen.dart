import 'package:bazzar_app/features/intial_screens/models/onboarding_model.dart';
import 'package:bazzar_app/features/intial_screens/wigets/onboarding_widget.dart';
import 'package:bazzar_app/features/intial_screens/wigets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPageModel> onboardingPages = [
    OnboardingPageModel(
      imageUrl: 'assets/images/Frame-2.png',
      title: 'Now reading books will be easier',
      description:
          'Discover new worlds, join a vibrant reading community.Start your reading adventure effortlessly with us.',
    ),
    OnboardingPageModel(
      imageUrl: 'assets/images/Frame-1.png',
      title: 'Your Bookish Soulmate Awaits',
      description:
          'Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience.',
    ),
    OnboardingPageModel(
      imageUrl: 'assets/images/Frame.png',
      title: 'Start Your Adventure',
      description:
          'Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let\'s go!',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (mounted) {
        setState(() {
          _currentPage = _pageController.page?.round() ?? 0;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = _currentPage == onboardingPages.length - 1;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingPages.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingPage(
                  page: onboardingPages[index],
                  currentPage: _currentPage,
                  onboardingPages: onboardingPages,
                  pageController: _pageController,
                );
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              left: 5.w,
              right: 5.w,
              bottom: isLastPage ? 10.h : 8.h,
              top: 0,
            ),
            child: BuildButtons(
              pageController: _pageController,
              currentPage: _currentPage,
              onboardingPages: onboardingPages,
            ),
          ),
        ],
      ),
    );
  }
}
