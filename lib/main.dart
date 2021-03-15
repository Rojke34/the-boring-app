import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theboringapp/constants.dart';
import 'package:theboringapp/model/hobby.dart';
import 'package:lottie/lottie.dart';
import 'package:shake/shake.dart';
import 'package:vibration/vibration.dart';
import 'dart:math';
import 'package:flip_card/flip_card.dart';

import 'credits.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // systemNavigationBarColor: Colors., // navigation bar color
    // statusBarColor: Colors.pink, // status bar color
    statusBarBrightness: Brightness.light, //status bar brigtness
    statusBarIconBrightness: Brightness.light, //status barIcon Brightness
    // systemNavigationBarDividerColor: Colors.greenAccent, //Navigation bar divider color
    systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icon
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: kBackgroundColor,
          child: SafeArea(
            child: Column(
              children: [
                //LottieCard(hobby: hobbiesList[0]),
                HomeScreenNavBar(),
                SizedBox(height: 24),
                Shake(),
                SizedBox(height: 24),
                Text("Sólo son sugerencias el resto depende de ti para superar el aburrimiento 😂.", style: TextStyle(fontSize: 8),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Shake extends StatefulWidget {
  @override
  _ShakeState createState() => _ShakeState();
}

class _ShakeState extends State<Shake> {
  ValueNotifier<int> _random = ValueNotifier<int>(0);
  final ValueNotifier<bool> _isShaked = ValueNotifier<bool>(false);
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  void initState() {
    ShakeDetector detector = ShakeDetector.waitForStart(onPhoneShake: () {
      // Do stuff on phone shake

      if (_isShaked.value == false) {
        _isShaked.value = true;
        cardKey.currentState.toggleCard();

        Random random = new Random();
        _random.value = random.nextInt(hobbiesList.length);

        Future.delayed(const Duration(milliseconds: 7000), () {
          _isShaked.value = false;
          cardKey.currentState.toggleCard();
        });

        Vibration.vibrate(duration: 1000);
      }
    });

    detector.startListening();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: kBackgroundColor,
        ),
        child: FlipCard(
          key: cardKey,
          flipOnTouch: false,
          direction: FlipDirection.HORIZONTAL,
          back: ValueListenableBuilder(
            valueListenable: _random,
            builder: (context, value, widget) {
              return LottieCard(hobby: hobbiesList[value]);
            },
          ),
          front: FrontCard(),
        ),
      ),
    ]);
  }
}

class LottieCard extends StatelessWidget {
  LottieCard({this.hobby});
  final Hobby hobby;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 450,
            decoration: BoxDecoration(color: kBackgroundColor, boxShadow: [
              BoxShadow(
                  color: Color(0x0000000).withOpacity(0.1),
                  offset: Offset(10, 10),
                  blurRadius: 50),
            ]),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    width: kCardWidth,
                    height: 300,
                    decoration: BoxDecoration(
                      color: kBackgroundColor,
                    ),
                    child: Lottie.asset(
                      hobby.json,
                      repeat: true,
                      reverse: false,
                      animate: true,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Container(
                  width: kCardWidth,
                  height: 130,
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          hobby.description,
                          style: kDescriptionLabelStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FrontCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        width: 300,
        height: 450,
        decoration: BoxDecoration(
          color: kBackgroundColor,
        ),
        child: Center(
          child: Text(
            "Shake it! Shake it!",
            style: kLargeTitleStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ]);
  }
}

class HomeScreenNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("The Boring app", style: kLargeTitleStyle),
          HomeCreditButton(),
        ],
      ),
    );
  }
}

class HomeCreditButton extends StatelessWidget {
  const HomeCreditButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Credit(), fullscreenDialog: true),
        );
      },
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      highlightColor: Color(0xFFFFFFFF),
      splashColor: Color(0xFFFFFFFF),
      constraints: BoxConstraints(maxHeight: 40.0, maxWidth: 80.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFF565656),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                  color: Color(0x0000000).withOpacity(0.1),
                  offset: Offset(0, 2),
                  blurRadius: 20),
            ]),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Credits",
            style: kDarkButtonLabelStyle,
          ),
        ),
      ),
    );
  }
}
