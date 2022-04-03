import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:monkey/database/authentication/google_sign_in.dart';
import 'package:monkey/pages/main_screen.dart';
import 'package:monkey/util/utility.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class LoginOptions extends StatefulWidget {
  const LoginOptions({Key? key}) : super(key: key);

  @override
  State<LoginOptions> createState() => _LoginOptionsState();
}

User user = User("123", "Luka Bican", "lukabican18@gmail.com", "https://pbs.twimg.com/profile_images/1161723750464872448/Pv6vynKg_400x400.jpg");

class _LoginOptionsState extends State<LoginOptions> {
  GoogleSignInAccount? current_user;

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) async {
      setState(() {
        current_user = account;
      });
      if (await _googleSignIn.isSignedIn()) {
        if (current_user != null) {
         // user.id = current_user!.id;
          //user.name = current_user!.displayName ?? '';
         // user.email = current_user!.email;
         // user.photoUrl = current_user!.photoUrl ?? '';
        }

        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => FirstScreen(),
          ),
        );
      }
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
          onPressed: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => FirstScreen(),
              ),
            );
          }
          ),
      ],
    );
  }
}

void signOut() {
  _googleSignIn.disconnect();
}

Future<void> signIn() async {
  print('heloo!!!!!');
  try {
    await _googleSignIn.signIn();
  } catch (e) {
    print("error signing in: $e");
  }
}
