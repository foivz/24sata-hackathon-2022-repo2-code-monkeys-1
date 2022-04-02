import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:monkey/main_screen.dart';

class LoginOptions extends StatefulWidget {
  const LoginOptions({Key? key}) : super(key: key);

  @override
  State<LoginOptions> createState() => _LoginOptionsState();
}

class _LoginOptionsState extends State<LoginOptions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        SignInButton(
          Buttons.Google,
          text: "Get started with Google",
          onPressed: () {},
        ),
        SignInButton(
          Buttons.FacebookNew,
          text: "Connect with Facebook",
          onPressed: () {},
        ),
        SignInButton(
          Buttons.Email,
          text: "Register with e-mail",
          onPressed: () {},
        )
      ],
    );
  }
}
