import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:monkey/main_screen.dart';

class LoginColumn extends StatefulWidget {
  const LoginColumn({Key? key}) : super(key: key);

  @override
  State<LoginColumn> createState() => _LoginColumnState();
}

class _LoginColumnState extends State<LoginColumn> {
  FocusNode userFocus = FocusNode();
  FocusNode passFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: const TextField(
              style: TextStyle(color: Colors.blueAccent),
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  prefixIcon: Icon(Icons.mail_outlined, color: Colors.white70),
                  labelText: "Type your email: ",
                  labelStyle: TextStyle(color: Colors.white70)),
            )
          )
        ),
        const SizedBox(height: 24),

        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: const TextField(
              obscureText: true,
              style: TextStyle(color: Colors.blueAccent),
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  prefixIcon: Icon(Icons.key_outlined, color: Colors.white70),
                  labelText: "Type your password: ",
                  labelStyle: TextStyle(color: Colors.white70)),
            )
          )
        ),
        const SizedBox(height: 24),

        Row(children: <Widget> [
          ElevatedButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const FirstScreen(),
                ),
              );
            },
            child: const Text("Login"),
          ),

          Spacer(),

          SignInButton(
            Buttons.Email,
            text: "Register with e-mail",
            onPressed: () {},
          ),

          Text("")
        ],),

      ],
    );
  }
}
