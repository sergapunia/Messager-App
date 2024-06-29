import 'package:flutter/material.dart';
import 'package:test_messager_app/messages_bot.dart';
import 'package:test_messager_app/screens/home_screen.dart';
import 'package:test_messager_app/user_contacts.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  bool start = true;
  @override
  Widget build(BuildContext context) {
    final userInherit = UserInherited.of(context);
    if (start == true) {
      MessagesForBot.messageList.forEach((message) =>
          userInherit.addMessageContact(
              userInherit.contactList[0],
              message["my"],
              message["message"],
              message["image"],
              message["time"]));
      start = false;
    }
    MessagesForBot.messageList2.forEach((message) =>
        userInherit.addMessageContact(userInherit.contactList[1], message["my"],
            message["message"], message["image"], message["time"]));

    return HomeScreen();
  }
}
