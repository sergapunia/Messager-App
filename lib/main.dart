import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_messager_app/user_contacts.dart';

import 'screens/home_screen.dart';

void main() {
  const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // Navigation bar
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark);
  runApp(UserInherited(
    contactsServise: UserContactsService(),
    child: MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
