import 'package:flutter/material.dart';
import 'package:safety_app/constants/app_styles.dart';
import 'package:safety_app/constants/app_theme.dart';

class SOSButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  SOSButton({super.key, required this.text, required this.onPressed});

  @override
  _SOSButtonState createState() => _SOSButtonState();
}

class _SOSButtonState extends State<SOSButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: Container(
        width: 200,
        height: 200,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _isPressed ? AppTheme.kSecondaryColor : AppTheme.kPrimaryColor,
          boxShadow: _isPressed
              ? [
                  BoxShadow(
                    color: Colors.purple[500]!,
                    offset: Offset(10, 10),
                    blurRadius: 8.0,
                    blurStyle: BlurStyle.normal,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-10, -10),
                    blurRadius: 8.0,
                    blurStyle: BlurStyle.normal,
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.purple[300]!,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-2.0, -2.0),
                    blurRadius: 4.0,
                  ),
                ],
        ),
        child: Center(
          child: Text(widget.text,
              style: kInterMedium.copyWith(
                fontSize: 48,
                color: AppTheme.kWhite,
              )),
        ),
      ),
    );
  }
}
