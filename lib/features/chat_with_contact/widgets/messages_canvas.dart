import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../user_contacts.dart';
import 'message.dart';

class MessagesCanvas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userInherit = UserInherited.of(context);
    final contact = userInherit.activeMessageContact;
    return contact == null
        ? const Center(child: Text("Ошибка выбора контакта"))
        : Expanded(
            child: ListView.builder(
              reverse: true,
              shrinkWrap: true,
              itemCount: contact.messages.length,
              itemBuilder: (context, index) {
                return contact.messages.isEmpty
                    ? const Center(child: Text("Нет сообщений"))
                    : message(contact.messages.reversed.toList()[index]);
              },
            ),
          );
    //});
  }
}
