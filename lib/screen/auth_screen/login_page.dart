import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';
import 'package:safety_app/constants/app_styles.dart';
import 'package:safety_app/constants/app_theme.dart';
import 'package:safety_app/constants/size_config.dart';
import 'package:safety_app/models/login_animation.dart';
import 'package:safety_app/router/router_constants.dart';
import 'package:safety_app/utils/utlis.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Artboard? riveArtboard;
  late RiveAnimationController controllerIdle;
  late RiveAnimationController controllerHandsUp;
  late RiveAnimationController controllerHandsDown;
  late RiveAnimationController controllerLookLeft;
  late RiveAnimationController controllerLookRight;
  late RiveAnimationController controllerSuccess;
  late RiveAnimationController controllerFail;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  final passwordFocusNode = FocusNode();

  bool isLookingLeft = false;
  bool isLookingRight = false;

  void removeAllControllers() {
    riveArtboard?.artboard.removeController(controllerIdle);
    riveArtboard?.artboard.removeController(controllerHandsUp);
    riveArtboard?.artboard.removeController(controllerHandsDown);
    riveArtboard?.artboard.removeController(controllerLookLeft);
    riveArtboard?.artboard.removeController(controllerLookRight);
    riveArtboard?.artboard.removeController(controllerSuccess);
    riveArtboard?.artboard.removeController(controllerFail);
    isLookingLeft = false;
    isLookingRight = false;
  }

  void addIdleController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerIdle);
  }

  void addHandsUpController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerHandsUp);
  }

  void addHandsDownController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerHandsDown);
  }

  void addSuccessController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerSuccess);
  }

  void addFailController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerFail);
  }

  void addLookRightController() {
    removeAllControllers();
    isLookingRight = true;
    riveArtboard?.artboard.addController(controllerLookRight);
  }

  void addLookLeftController() {
    removeAllControllers();
    isLookingLeft = true;
    riveArtboard?.artboard.addController(controllerLookLeft);
  }

  void checkForPasswordFocusNodeToChangeAnimationState() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        addHandsUpController();
      } else if (!passwordFocusNode.hasFocus) {
        addHandsDownController();
      }
    });
  }

  void validateEmailAndPassword() {
    Future.delayed(const Duration(seconds: 1), () {
      if (formKey.currentState!.validate()) {
        addSuccessController();
      } else {
        addFailController();
      }
    });
  }

  void handleLogin(BuildContext context) async {
    try {
      if (formKey.currentState!.validate()) {
        await _auth.signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text.toString());

        // Authentication successful
        addSuccessController();

        // Delay the navigation to the home screen
        Future.delayed(const Duration(seconds: 1), () {
          GoRouter.of(context).pushNamed(RouteConstant.homescreen);
        });
      }
    } catch (error) {
      addFailController();
    }
  }

  @override
  void initState() {
    super.initState();
    controllerIdle = SimpleAnimation(AnimationEnum.idle.name);
    controllerHandsUp = SimpleAnimation(AnimationEnum.Hands_up.name);
    controllerHandsDown = SimpleAnimation(AnimationEnum.hands_down.name);
    controllerLookRight = SimpleAnimation(AnimationEnum.Look_down_right.name);
    controllerLookLeft = SimpleAnimation(AnimationEnum.Look_down_left.name);
    controllerSuccess = SimpleAnimation(AnimationEnum.success.name);
    controllerFail = SimpleAnimation(AnimationEnum.fail.name);

    rootBundle.load('assets/animation/animatedlogin.riv').then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      artboard.addController(controllerIdle);
      setState(() {
        riveArtboard = artboard;
      });
    });

    checkForPasswordFocusNodeToChangeAnimationState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

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
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Login",
                  style: kInterBold.copyWith(
                    fontSize: 32,
                    color: AppTheme.kPrimaryColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 220,
                width: SizeConfig.screenWidth,
                child: riveArtboard == null
                    ? const SizedBox.shrink()
                    : Rive(
                        artboard: riveArtboard!,
                        fit: BoxFit.fitWidth,
                      ),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIconColor: AppTheme.kSecondaryColor,
                        prefixIcon: const Icon(Icons.alternate_email_rounded),
                        hintStyle: kInterRegular.copyWith(
                            color: AppTheme.kGrey, fontSize: 15),
                        hintText: "ombhusal066@gmail.com",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kBorderRadius10),
                          borderSide: const BorderSide(
                            width: 2,
                            color: AppTheme.kPrimaryColor,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty &&
                            value.length < 16 &&
                            !isLookingLeft) {
                          addLookLeftController();
                        } else if (value.isNotEmpty &&
                            value.length > 16 &&
                            !isLookingRight) {
                          addLookRightController();
                        }
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          addFailController();
                          return 'Enter Email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIconColor: AppTheme.kSecondaryColor,
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        hintStyle: kInterRegular.copyWith(
                            color: AppTheme.kGrey, fontSize: 15),
                        hintText: "Password",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kBorderRadius10),
                          borderSide: const BorderSide(
                            width: 2,
                            color: AppTheme.kPrimaryColor,
                          ),
                        ),
                      ),
                      focusNode: passwordFocusNode,
                      validator: (value) {
                        if (value!.isEmpty) {
                          addFailController();
                          return 'Enter Password';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .pushNamed(RouteConstant.forgetpassscreen);
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forget Password?",
                    style: kInterRegular.copyWith(
                        fontSize: 14,
                        color: AppTheme.kSecondaryColor,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  handleLogin(context);

                  passwordFocusNode.unfocus();
                },
                child: Text(
                  "Login",
                  style: kInterBold.copyWith(
                    color: AppTheme.kWhite,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(345, 56),
                    elevation: 1,
                    backgroundColor: AppTheme.kSecondaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius10))),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 20,
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
                        borderRadius: BorderRadius.circular(kBorderRadius10))),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account?",
                    style: kInterMedium.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context)
                          .goNamed(RouteConstant.registerscreen);
                    },
                    child: Text(
                      "Register",
                      style: kInterBold.copyWith(
                        fontSize: 16,
                        color: AppTheme.kSecondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
