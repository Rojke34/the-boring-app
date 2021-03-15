import 'dart:io';

import 'package:flutter/material.dart';

//Colors
const kBackgroundColor = Color(0xFFE7EEFB);
const kPrimaryLabelColor = Color(0xFF888888);
const kSecondaryLabelColor = Color(0xFF797F8A);
const kDarkButtonLabelColor = Color(0xFFFFFFFF);

//Text Styles
var kLargeTitleStyle = TextStyle(
  fontSize: 24.0,
  color: kPrimaryLabelColor,
  fontWeight: FontWeight.bold,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Roboto',
  decoration: TextDecoration.none,
);

var kTitleStyle = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.bold,
  color: kSecondaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Roboto',
  decoration: TextDecoration.none,
);

var kDescriptionLabelStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.normal,
  color: kSecondaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Roboto',
  decoration: TextDecoration.none,
);

var kOptionalLabelStyle = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.normal,
  color: kSecondaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Roboto',
  decoration: TextDecoration.none,
);

var kDarkButtonLabelStyle = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.normal,
  color: kDarkButtonLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Roboto',
  decoration: TextDecoration.none,
);

//Dimension
const kCardWidth = 300.0;