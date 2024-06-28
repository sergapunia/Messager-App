import 'package:flutter/material.dart';

import '../../../user_contacts.dart';

Widget avatarUser(Contact contact) {
  return Container(
    margin: const EdgeInsets.all(10),
    child: CircleAvatar(
      radius: 30,
      backgroundImage: contact.urlLogo != null
          ? AssetImage(contact.urlLogo.toString())
          : null,
      backgroundColor: contact.urlLogo == null ? Colors.green : null,
      child: contact.urlLogo == null
          ? Text(
              contact.name[0] + contact.surname[0],
            )
          : null,
    ),
  );
}
