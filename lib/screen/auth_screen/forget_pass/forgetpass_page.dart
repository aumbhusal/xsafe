import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_app/constants/app_images.dart';
import 'package:safety_app/constants/app_string.dart';
import 'package:safety_app/constants/app_styles.dart';
import 'package:safety_app/constants/app_theme.dart';
import 'package:safety_app/constants/size_config.dart';
import 'package:safety_app/router/router_constants.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kPadding32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Center(
                child: Image.asset(AppImages.forgetPassword),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Forget Password?",
                style: kInterBold.copyWith(
                  color: AppTheme.kPrimaryColor,
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                AppString.forgetpass,
                style: kInterMedium.copyWith(
                  color: AppTheme.kLightGrey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintStyle: kInterRegular.copyWith(
                      color: AppTheme.kGrey, fontSize: 15),
                  hintText: "Enter Phone Number",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kBorderRadius10),
                    borderSide: const BorderSide(
                      width: 2,
                      color: AppTheme.kPrimaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context)
                      .pushNamed(RouteConstant.forgetpassverifyscreen);
                },
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
