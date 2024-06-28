import 'package:flutter/material.dart';

import '../../../user_contacts.dart';

//! С инхеритом**

class MessagesCanvas extends StatelessWidget {
  MessagesCanvas({required this.contact});
  Contact contact;
  @override
  Widget build(BuildContext context) {
    final userInherit = UserInherited.of(context);
    return ListenableBuilder(
      listenable: userInherit,
      builder: (context,child)
      {
        final contact = userInherit.activeMessageContact;
        return contact==null?const Center(child: Text("Ошибка выбора контакта")):
        ListView.builder(
        itemCount: contact.messages.length,
        itemBuilder: (context, index) {
          return contact.messages.isEmpty
              ? const Center(child: Text("Нет Сообщений"))
              : message(contact.messages[index]);
        },
      );}
    );
  }
}

Widget message(Message message) {
  return Text(message.message);
}
