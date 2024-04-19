import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:sound_africa/resources/managers/image_manager.dart';
import 'package:sound_africa/resources/managers/values_manager.dart';
import 'package:sound_africa/views/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Image.asset(
          ImageManager.splashLogo,
          height: AppSize.s50,
          width: AppSize.s150,
        ),
      ),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.white,
      curve: Curves.easeIn,
      duration: DurationConstant.d300,
      nextScreen: const OnboardingScreen(),
    );
  }
}
