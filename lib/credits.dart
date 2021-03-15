import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'constants.dart';
import 'model/hobby.dart';
import 'package:url_launcher/url_launcher.dart';

class Credit extends StatefulWidget {
  @override
  _CreditState createState() => _CreditState();
}

class _CreditState extends State<Credit> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          color: kBackgroundColor,
          child: Padding(
            padding: EdgeInsets.only(left: 20, top: 64, right: 20, bottom: 10),
            child: AnimatedList(
              key: _key,
              initialItemCount: hobbiesList.length,
              itemBuilder: (context, index, animation) {
                return _buildItem(hobbiesList[index], animation, index);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(Hobby hobby, Animation animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        elevation: 1,
        child: ListTile(
          title: Text(hobby.optional, style: kOptionalLabelStyle),
          subtitle: Text(index == 0 ? hobby.description : "Lottiefiles - Animador", style: kOptionalLabelStyle),
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Lottie.asset(
              hobby.json,
              repeat: true,
              reverse: false,
              animate: index == 0 ? true : false,
              fit: BoxFit.scaleDown,
            ),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.link_sharp,
              color: Colors.green,
            ),
            onPressed: () {
              _launchURL(hobby.author);
            },
          ),
        ),
      ),
    );
  }
}

_launchURL(String url) async {
  await launch(url.toString());
}
