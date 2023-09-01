import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:safety_app/constants/app_images.dart';
import 'package:safety_app/constants/app_styles.dart';
import 'package:safety_app/constants/app_theme.dart';
import 'package:safety_app/router/router_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding', false);
    GoRouter.of(context).goNamed(RouteConstant.welcomescreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      showNextButton: true,
      showSkipButton: true,
      done: const Text("Done"),
      skip: const Text("Skip"),
      next: Card(
        shadowColor: AppTheme.kSecondaryColor,
        color: AppTheme.kSecondaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.navigate_next,
            color: AppTheme.kWhite,
          ),
        ),
      ),
      skipStyle: TextButton.styleFrom(
          primary: AppTheme.kLightGrey, textStyle: kInterMedium.copyWith()),
      doneStyle: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.kSecondaryColor,
        foregroundColor: AppTheme.kWhite,
        elevation: 5,
        shadowColor: AppTheme.kSecondaryColor,
        minimumSize: const Size(45, 45),
      ),
      dotsDecorator: DotsDecorator(
        size: const Size.square(8.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: AppTheme.kPrimaryColor,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius20)),
      ),
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      pages: [
        PageViewModel(
          decoration: const PageDecoration(
            bodyAlignment: Alignment.center,
            bodyPadding: EdgeInsets.all(kPadding8),
            imageFlex: 2,
          ),
          image: Image.asset(AppImages.onboardingOne),
          title: "Welcome to SafetyGuard!",
          body:
              "Empowering you for a safer today and tomorrow. Let's start enhancing your safety with these features:",
        ),
        PageViewModel(
          decoration: const PageDecoration(
            bodyAlignment: Alignment.center,
            bodyPadding: EdgeInsets.all(kPadding8),
            imageFlex: 2,
          ),
          image: Image.asset(AppImages.onboardingTwo),
          title: "SOS Button",
          body:
              "Your instant connection to help. Press the SOS button for swift assistance from emergency contacts.",
        ),
        PageViewModel(
          decoration: const PageDecoration(
            bodyAlignment: Alignment.center,
            imageFlex: 2,
            bodyPadding: EdgeInsets.all(kPadding8),
          ),
          image: Image.asset(AppImages.onboardingThree),
          title: "Stay Informed",
          body:
              "Real-time local safety alerts and crime updates keep you aware and prepared for any situation.",
        ),
      ],
    ));
  }
}
