import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_app/constants/app_string.dart';
import 'package:safety_app/constants/app_styles.dart';
import 'package:safety_app/constants/app_theme.dart';
import 'package:safety_app/router/router_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safety_app/utils/utlis.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool loading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String _textFieldValue = '';

  FirebaseAuth _auth = FirebaseAuth.instance;

  void createAccount() {
    _auth
        .createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((value) {})
        .onError(
      (error, stackTrace) {
        Utils().toastMessage(
          error.toString(),
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(kPadding32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Text(
                "Register",
                style: kInterBold.copyWith(
                  color: AppTheme.kPrimaryColor,
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                AppString.register,
                style: kInterMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.account_circle_outlined),
                          prefixIconColor: AppTheme.kSecondaryColor,
                          hintStyle: kInterRegular.copyWith(
                              color: AppTheme.kGrey, fontSize: 15),
                          hintText: "User Name",
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(kBorderRadius10),
                            borderSide: const BorderSide(
                              width: 2,
                              color: AppTheme.kPrimaryColor,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Username';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIconColor: AppTheme.kSecondaryColor,
                          prefixIcon: const Icon(Icons.alternate_email_rounded),
                          hintStyle: kInterRegular.copyWith(
                              color: AppTheme.kGrey, fontSize: 15),
                          hintText: "ombhusal066@gmail.com",
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(kBorderRadius10),
                            borderSide: const BorderSide(
                              width: 2,
                              color: AppTheme.kPrimaryColor,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          prefixIconColor: AppTheme.kSecondaryColor,
                          prefixIcon: const Icon(Icons.lock_outline_rounded),
                          hintStyle: kInterRegular.copyWith(
                              color: AppTheme.kGrey, fontSize: 15),
                          hintText: ".......",
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(kBorderRadius10),
                            borderSide: const BorderSide(
                              width: 2,
                              color: AppTheme.kPrimaryColor,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  )),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    createAccount();
                  }
                },
                child: Text(
                  "Register",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
