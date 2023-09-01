import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_app/constants/app_string.dart';
import 'package:safety_app/constants/app_styles.dart';
import 'package:safety_app/constants/app_theme.dart';
import 'package:safety_app/router/router_constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.kWhite,
      body: Padding(
        padding: const EdgeInsets.all(kPadding32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppString.welcome,
              style: kInterMedium.copyWith(
                fontSize: 24,
              ),
            ),
            Text(
              AppString.appname,
              style: kInterBold.copyWith(
                fontSize: 32,
                color: AppTheme.kLightBlue,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              AppString.appdescription,
              style: kInterSemiBold.copyWith(
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Let's get Started.. ",
              style: kInterRegular.copyWith(
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            OutlinedButton.icon(
              // <-- OutlinedButton
              onPressed: () {},
              icon: const Icon(
                Icons.g_mobiledata_rounded,
                size: 38.0,
              ),

              label: Text(
                'Sign with Google',
                style: kInterBold.copyWith(
                  fontSize: 16,
                  color: AppTheme.kBlack,
                ),
              ),
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppTheme.kBlack, width: 1.9),
                  minimumSize: const Size(345, 56),
                  elevation: 1,
                  textStyle: const TextStyle(color: AppTheme.kBlack),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kBorderRadius20))),
            ),
            const SizedBox(
              height: 24,
            ),
            OutlinedButton.icon(
              // <-- OutlinedButton
              onPressed: () {
                GoRouter.of(context).goNamed(RouteConstant.loginscreen);
              },
              icon: const Icon(
                Icons.g_mobiledata_rounded,
                size: 38.0,
              ),

              label: Text(
                'Continue with Email',
                style: kInterBold.copyWith(
                  fontSize: 16,
                  color: AppTheme.kBlack,
                ),
              ),
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppTheme.kBlack, width: 1.9),
                  minimumSize: const Size(345, 56),
                  elevation: 1,
                  textStyle: const TextStyle(color: AppTheme.kBlack),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kBorderRadius20))),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: kInterMedium,
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).goNamed(RouteConstant.loginscreen);
                  },
                  child: Text(
                    "Login",
                    style: kInterBold.copyWith(
                      color: AppTheme.kSecondaryColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
