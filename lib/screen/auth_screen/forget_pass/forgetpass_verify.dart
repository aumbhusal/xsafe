import 'package:flutter/material.dart';
import 'package:safety_app/constants/app_images.dart';
import 'package:safety_app/constants/app_styles.dart';
import 'package:safety_app/constants/app_theme.dart';

class ForgetPassVerify extends StatefulWidget {
  const ForgetPassVerify({super.key});

  @override
  State<ForgetPassVerify> createState() => _ForgetPassVerifyState();
}

class _ForgetPassVerifyState extends State<ForgetPassVerify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(kPadding32),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Center(child: Image.asset(AppImages.forgetPasswordVerify)),
              const SizedBox(
                height: 30,
              ),
              Text(
                "OTP Verification",
                style: kInterSemiBold.copyWith(
                  color: AppTheme.kPrimaryColor,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 56,
                    height: 56,
                    child: Card(
                      elevation: 5,
                      color: AppTheme.kGrey,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(kPadding16),
                        child: TextField(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: 56,
                    height: 56,
                    child: Card(
                      elevation: 5,
                      color: AppTheme.kGrey,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(kPadding16),
                        child: TextField(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: 56,
                    height: 56,
                    child: Card(
                      elevation: 5,
                      color: AppTheme.kGrey,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(kPadding16),
                        child: TextField(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: 56,
                    height: 56,
                    child: Card(
                      elevation: 5,
                      color: AppTheme.kGrey,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(kPadding16),
                        child: TextField(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t receive code ? ",
                    style: kInterRegular,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Resend the code",
                      style: kInterSemiBold.copyWith(
                        color: AppTheme.kSecondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Continue",
                  style: kInterBold.copyWith(
                    color: AppTheme.kWhite,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(325, 56),
                    elevation: 1,
                    backgroundColor: AppTheme.kSecondaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius20))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
