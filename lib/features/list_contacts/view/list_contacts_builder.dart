import 'package:flutter/material.dart';
import 'package:test_messager_app/user_contacts.dart';
import '../widgets/contact_card.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Contact> contacts = UserContacts.contactList;
    contacts[0].messages.add(Message(
        sender: contacts[0].name,
        message: "Привет,дружочек",
        time: DateTime.parse("2024-06-27 11:10:02.761372")));
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(
              height: 0.1,
              thickness: 0.2,
            ),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ContactCard(contact: contacts[index]);
        });
  }
}
