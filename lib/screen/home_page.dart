import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_app/constants/app_theme.dart';
import 'package:safety_app/router/router_constants.dart';
import 'package:safety_app/widget/navbar.dart';
import 'package:safety_app/widget/sos_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut().then((value) {
                  GoRouter.of(context).pushNamed(RouteConstant.loginscreen);
                });
              },
              icon: Icon(
                Icons.logout,
                color: AppTheme.kGrey,
              ))
        ],
      ),
      body: Column(
        children: [],
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
