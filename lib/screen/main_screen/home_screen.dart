import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safety_app/constants/app_styles.dart';
import 'package:safety_app/constants/app_theme.dart';
import 'package:safety_app/widget/sos_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kPadding32),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppTheme.kLightBlue,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi! Om",
                        style: kInterMedium.copyWith(
                          fontSize: 15,
                          color: Colors.grey[700],
                        ),
                      ),
                      Text(
                        "Complete Profile",
                        style: kInterSemiBold.copyWith(
                          color: AppTheme.kSecondaryColor,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Butwal...",
                        style: kInterMedium.copyWith(
                          fontSize: 15,
                          color: Colors.grey[700],
                        ),
                      ),
                      Text(
                        "Safe",
                        style: kInterSemiBold.copyWith(
                          color: AppTheme.kSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FaIcon(
                    FontAwesomeIcons.locationArrow,
                    color: AppTheme.kPrimaryColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Text(
                "Emergency help Needed?",
                style: kInterMedium.copyWith(
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: SOSButton(
                  text: "SOS",
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Pressed SOS button to send messages"),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Card(
                    color: AppTheme.kWhite,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: SizedBox(
                      width: 150,
                      height: 100,
                    ),
                  ),
                  Card(
                    color: AppTheme.kWhite,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: SizedBox(
                      width: 150,
                      height: 100,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Card(
                    color: AppTheme.kWhite,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: SizedBox(
                      width: 150,
                      height: 100,
                    ),
                  ),
                  Card(
                    color: AppTheme.kWhite,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: SizedBox(
                      width: 150,
                      height: 100,
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
