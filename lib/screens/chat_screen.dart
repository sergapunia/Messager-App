import 'package:flutter/material.dart';

import '../features/chat_with_contact/chat_with_contact.dart';
import '../user_contacts.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({required this.contact});
  Contact contact;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleChat(contact, context),
    );
  }
}
