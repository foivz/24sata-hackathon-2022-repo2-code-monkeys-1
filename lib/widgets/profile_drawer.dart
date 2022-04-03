import 'package:flutter/material.dart';
import 'package:monkey/pages/login_screen.dart';
import 'package:monkey/pages/signup_options.dart';
import 'package:monkey/pages/tips_and_tricks.dart';

class SeparatedDrawer extends StatefulWidget {
  const SeparatedDrawer({Key? key}) : super(key: key);

  @override
  State<SeparatedDrawer> createState() => _SeparatedDrawerState();
}

class _SeparatedDrawerState extends State<SeparatedDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text(user.name),
              accountEmail: Text(user.email),
              currentAccountPicture: GestureDetector(
                //OnTAP DELETED
                //REMOVE CONST!!!
                child: CircleAvatar(
                  backgroundImage: NetworkImage(user.photoUrl.compareTo('') == 0
                      ? user.photoUrl
                      : "https://cdn.pixabay.com/photo/2018/08/28/12/41/avatar-3637425__340.png"),
                ),
              ),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("lib/images/blob.png")))),
          ListTile(
              title: const Text("Settings"),
              trailing: const Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const LoginScreen()));
              }),
          ListTile(
              title: const Text("Groups"),
              trailing: const Icon(Icons.group),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const LoginScreen()));
              }),
          ListTile(
              title: const Text("Tips& ricks"),
              trailing: const Icon(Icons.info_outline),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const Tips()));
              }),
          const Divider(),
          ListTile(
              title: const Text("Sign out"),
              trailing: const Icon(Icons.logout),
              onTap: () => {
                    Navigator.of(context).pop(),
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const LoginScreen()))
                  })
        ],
      ),
    );
  }
}
