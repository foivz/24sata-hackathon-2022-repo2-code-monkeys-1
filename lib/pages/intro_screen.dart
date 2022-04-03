import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:monkey/pages/login_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        title: "Finances.",
        description: "Get the big picture on all your money.",
        pathImage: "lib/images/wallet.png",
        backgroundColor: const Color(0xffAF3B6E),
      ),
    );
    slides.add(
      Slide(
        title: "Shopping Lists.",
        description: "Make your shopping experience easier with our shopping lists..",
        pathImage: "lib/images/list.png",
        backgroundColor: const Color(0xff424651),
      ),
    );
    slides.add(
      Slide(
        title: "Family.",
        description:
        "Budget together with your family, track their expenses and set goals.",
        pathImage: "lib/images/family.png",
        backgroundColor: const Color(0xff009F6B),
      ),
    );
  }

  void onDonePress() {
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
    );
  }
}
