import 'package:decimal/decimal.dart';
import 'package:monkey/database/database.dart';
import 'package:monkey/pages/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monkey/models/category.dart';
import 'package:monkey/pages/intro_screen.dart';
import 'pages/login_screen.dart';
import 'util/utility.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await Utility.refreshData();
  Utility.database.createCategory('Food');
  Utility.database.createCategory('Shopping');
  Utility.database.createCategory('Life');
  Utility.database.createCategory('Transportation');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Utility.database.createGroup(Decimal.zero, Utility.itemListList,
    //    Utility.transactionList, Utility.budgetList, false);

    return MaterialApp(
        title: 'App',
        theme: ThemeData(
          textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.blue,
        ),
        home: const IntroScreen());
  }
}
