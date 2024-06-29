import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_messager_app/app_container.dart';
import 'package:test_messager_app/user_contacts.dart';

void main() {
  const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // Navigation bar
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark);
  runApp(UserInherited(
    contactsServise: UserContactsService(),
    child: MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
