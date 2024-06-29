import 'package:flutter/material.dart';
import 'package:test_messager_app/features/chat_with_contact/widgets/messages_canvas.dart';

import '../features/chat_with_contact/chat_with_contact.dart';
import '../features/chat_with_contact/widgets/bottom_margin.dart';
import '../user_contacts.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({required this.contact});
  Contact contact;
  @override
  Widget build(BuildContext context) {
    final userInherit = UserInherited.of(context);
    return ListenableBuilder(
      listenable: userInherit,
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: titleChat(contact, context),
        body: Column(
          children: [
            MessagesCanvas(),
            bottomBar(contact),
          ],
        ),
      ),
    );
  }
}
