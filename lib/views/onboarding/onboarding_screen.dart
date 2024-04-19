import 'package:flutter/material.dart';
import 'package:sound_africa/resources/managers/color_manager.dart';
import 'package:sound_africa/resources/managers/values_manager.dart';
import 'package:sound_africa/resources/widgets/buttons.dart';
import 'package:sound_africa/views/home/home_screen.dart';
import 'package:sound_africa/views/onboarding/pages/first.dart';
import 'package:sound_africa/views/onboarding/pages/second.dart';
import 'package:sound_africa/views/onboarding/pages/third.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<Widget> _pages = [
    const FirstPage(),
    const SecondPage(),
    const ThirdPage(),
  ];

  List<Widget> _buildIndicators() {
    List<Widget> indicators = [];
    for (int i = 0; i < _pages.length; i++) {
      indicators.add(AnimatedContainer(
        duration: const Duration(milliseconds: DurationConstant.d150),
        margin: const EdgeInsets.symmetric(horizontal: AppMargin.m8),
        height: AppSize.s8,
        width: AppSize.s24,
        decoration: BoxDecoration(
          color: _currentPage == i ? Colors.black : ash3Color,
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12)),
        ),
      ));
    }
    return indicators;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: _pages,
          ),
          Positioned(
              top: AppSize.s35,
              right: AppSize.s20,
              child: _currentPage == 0
                  ? const SizedBox()
                  : GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                      },
                      child: skipButton())),
          Positioned(
            bottom: AppSize.s50,
            left: AppSize.s0,
            right: AppSize.s0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicators(),
            ),
          ),
        ],
      ),
    );
  }
}
