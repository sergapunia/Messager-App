import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../../user_contacts.dart';

//! С инхеритом**

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

Widget message(Message message) {
  Radius radius = const Radius.circular(20);
  BorderRadius radiusBorder = BorderRadius.only(
      topLeft: radius,
      topRight: radius,
      bottomLeft: message.sender == "my" ? radius : const Radius.circular(0),
      bottomRight: message.sender != "my" ? radius : const Radius.circular(0));
  return Row(
    mainAxisAlignment: message.sender == "my"
        ? MainAxisAlignment.end
        : MainAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (message.image != null) image(message.image!),
            Row(
              children: [
                LimitedBox(
                  maxWidth: 300,
                  child: Text(
                    message.message == null ? "" : message.message!,
                  ),
                ),
                const SizedBox(width: 10),
                Text(DateFormat.Hm().format(message.time),
                    style: const TextStyle(fontSize: 10)),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: radiusBorder,
          color: message.sender == "my"
              ? const Color.fromRGBO(60, 237, 120, 1)
              : const Color.fromRGBO(237, 242, 246, 1),
        ),
      ),
    ],
  );
}

Widget image(String imageUrl) {
  return LimitedBox(
      maxWidth: 300,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ));
}
