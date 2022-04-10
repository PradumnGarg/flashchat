// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flash_app/components/rounded_button.dart';
import 'package:flash_app/screens/login_screen.dart';
import 'package:flash_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(animationController);

    animationController.forward();
    animation.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: 60.0,
                    ),
                  ),
                  Expanded(
                      child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Flash chat',
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 45.0,
                          fontWeight: FontWeight.w900,
                        ),
                        speed: const Duration(milliseconds: 200),
                      ),
                    ],
                    totalRepeatCount: 1,
                    pause: const Duration(milliseconds: 100),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(Colors.lightBlueAccent, 'Login', () {
              Navigator.pushNamed(context, LoginScreen.id);
            }),
            RoundedButton(Colors.blueAccent, 'Register', () {
              Navigator.pushNamed(context, RegistrationScreen.id);
            }),
          ],
        ),
      ),
    );
  }
}
