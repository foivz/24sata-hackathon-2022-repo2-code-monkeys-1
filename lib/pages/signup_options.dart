import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:monkey/database/authentication/google_sign_in.dart';
import 'package:monkey/main_screen.dart';
import 'package:provider/provider.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);

class LoginOptions extends StatefulWidget {
  const LoginOptions({Key? key}) : super(key: key);

  @override
  State<LoginOptions> createState() => _LoginOptionsState();
}

class _LoginOptionsState extends State<LoginOptions> {
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SignInButton(
          Buttons.Google,
          text: "Get started with Google",
          onPressed: signIn,
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

/*
void signOut() {
  _googleSignIn.disconnect();
}
*/

Future<void> signIn() async {
  try {
    await _googleSignIn.signIn();
  } catch (e) {
    print("error signing in: $e");
  }
  print('done');
}
