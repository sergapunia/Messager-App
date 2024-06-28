import 'package:flutter/material.dart';
import 'package:test_messager_app/features/list_contacts/widgets/search_bar.dart';
import 'package:test_messager_app/user_contacts.dart';
import '../widgets/contact_card.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final controller = TextEditingController();
  List<Contact> contacts = UserContacts.contactList;

  @override
  void initState() {
    contacts[0].messages.add(Message(
        sender: contacts[0].name,
        message: "Привет,дружочек",
        time: DateTime.parse("2024-06-27 11:10:02.761372")));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        searchBar(controller, searchChats),
        Expanded(
          child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                    height: 0.1,
                    thickness: 0.2,
                  ),
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ContactCard(contact: contacts[index]);
              }),
        ),
      ],
    );
  }

  void searchChats(String title) {
    List<Contact> result = [];
    if (title.isEmpty) {
      result = UserContacts.contactList;
    } else {
      result = contacts.where((contact) {
        return (contact.name + contact.surname)
            .toLowerCase()
            .contains(title.toLowerCase());
      }).toList();
    }

    setState(() => contacts = result);
  }
}
