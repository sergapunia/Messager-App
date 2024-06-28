import 'package:flutter/material.dart';
import 'package:test_messager_app/features/list_contacts/widgets/avatar_user.dart';

import '../../../user_contacts.dart';

AppBar titleChat(Contact contact, BuildContext context) {
  return AppBar(
    leadingWidth: 30,
    toolbarHeight: 80,
    leading: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_sharp)),
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        avatarUser(contact),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${contact.name} ${contact.surname}",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            Text(
              contact.online ? "В сети" : "не в сети",
              style: const TextStyle(color: Color(0xFFA1A5C0), fontSize: 15),
            )
          ],
        ),
      ],
    ),
  );
}
