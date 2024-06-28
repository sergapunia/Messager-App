import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:test_messager_app/user_contacts.dart';

import '../../../screens/chat_screen.dart';
import 'avatar_user.dart';

class ContactCard extends StatelessWidget {
  ContactCard({required this.contact});

  Contact contact;

  @override
  Widget build(BuildContext context) {
    List<Message> listMessages = contact.messages;
    return GestureDetector(
      onTap: () {
        Route route = MaterialPageRoute(
            builder: (context) => ChatScreen(contact: contact));
        Navigator.push(context, route);
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: avatarUser(contact), flex: 1),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${contact.name} ${contact.surname}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600)),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: Text(
                            listMessages.isNotEmpty
                                ? GetTimeAgo.parse(listMessages.last.time,
                                    locale: "ru")
                                : "",
                            style:
                                const TextStyle(fontWeight: FontWeight.w300)),
                      ),
                    ],
                  ),
                  Text(
                      listMessages.isNotEmpty
                          ? listMessages.last.message
                          : "Нет сообщений",
                      style: const TextStyle(fontWeight: FontWeight.w300))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
