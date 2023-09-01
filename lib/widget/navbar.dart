import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:safety_app/constants/app_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safety_app/screen/main_screen/chat_page.dart';
import 'package:safety_app/screen/main_screen/home_screen.dart';
import 'package:safety_app/screen/main_screen/location.dart';
import 'package:safety_app/screen/main_screen/tools_page.dart';
import 'package:safety_app/screen/main_screen/user_profile.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

List<Widget> _buildScreens() {
  return [
    Home(),
    LocationPage(),
    ChatPage(),
    ToolPage(),
    UserProfile(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: FaIcon(FontAwesomeIcons.house),
      title: ("Home"),
      activeColorPrimary: AppTheme.kPrimaryColor,
      inactiveColorPrimary: AppTheme.kGrey,
    ),
    PersistentBottomNavBarItem(
      icon: FaIcon(FontAwesomeIcons.locationDot),
      title: ("Settings"),
      activeColorPrimary: AppTheme.kPrimaryColor,
      inactiveColorPrimary: AppTheme.kGrey,
    ),
    PersistentBottomNavBarItem(
      icon: FaIcon(FontAwesomeIcons.rocketchat),
      title: ("sos"),
      activeColorPrimary: AppTheme.kPrimaryColor,
      inactiveColorPrimary: AppTheme.kGrey,
    ),
    PersistentBottomNavBarItem(
      icon: FaIcon(FontAwesomeIcons.toolbox),
      title: ("Settings"),
      activeColorPrimary: AppTheme.kPrimaryColor,
      inactiveColorPrimary: AppTheme.kGrey,
    ),
    PersistentBottomNavBarItem(
      icon: FaIcon(FontAwesomeIcons.user),
      title: ("Home"),
      activeColorPrimary: AppTheme.kPrimaryColor,
      inactiveColorPrimary: AppTheme.kGrey,
    ),
  ];
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style12, // Choose the nav bar style with this property.
    );
  }
}
