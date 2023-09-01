import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_app/errorpage.dart';
import 'package:safety_app/main.dart';
import 'package:safety_app/router/router_constants.dart';
import 'package:safety_app/screen/auth_screen/forget_pass/forgetpass_page.dart';
import 'package:safety_app/screen/auth_screen/forget_pass/forgetpass_verify.dart';
import 'package:safety_app/screen/auth_screen/login_page.dart';
import 'package:safety_app/screen/auth_screen/register.dart';
import 'package:safety_app/screen/auth_screen/welcome_screen.dart';
import 'package:safety_app/screen/home_page.dart';
import 'package:safety_app/screen/onboading_screen/onboarding_screen.dart';
import 'package:safety_app/screen/splash_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: RouteConstant.loginscreen,
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        name: RouteConstant.welcomescreen,
        path: '/welcome',
        builder: (BuildContext context, GoRouterState state) {
          return const WelcomeScreen();
        },
      ),
      GoRoute(
        name: RouteConstant.registerscreen,
        path: '/register',
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterPage();
        },
      ),
      GoRoute(
        name: RouteConstant.forgetpassscreen,
        path: '/forget-password',
        builder: (BuildContext context, GoRouterState state) {
          return const ForgetPassword();
        },
      ),
      GoRoute(
        name: RouteConstant.forgetpassverifyscreen,
        path: '/forget-passwordverify',
        builder: (BuildContext context, GoRouterState state) {
          return const ForgetPassVerify();
        },
      ),
      GoRoute(
        name: RouteConstant.onboardingscreen,
        path: '/onboardingscreen',
        builder: (BuildContext context, GoRouterState state) {
          return show ? OnBoardingScreen() : const WelcomeScreen();
        },
      ),
      GoRoute(
        name: RouteConstant.homescreen,
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
      GoRoute(
        name: RouteConstant.splashscreen,
        path: '/splashscreen',
        
        builder: (context, state) {
          return SplashScreen();


        },
      ),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: ErrorPage());
    },
  );
}
