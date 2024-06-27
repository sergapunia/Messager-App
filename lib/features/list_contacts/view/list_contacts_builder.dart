import 'package:flutter/material.dart';
import 'package:test_messager_app/user_contacts.dart';
import '../widgets/contact_card.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<Contact> contacts = UserContacts.contactList;
  final controller = TextEditingController();

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
      children: [
        Container(
          margin: EdgeInsets.all(12),
          child: TextField(
            controller: controller,
            onChanged: searchChats,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search, size: 40),
              hintText: "Поиск",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
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
    final results = contacts.where((contact) {
      final contactTitle = (contact.name + contact.surname).toLowerCase();
      final input = title.toLowerCase();
      return contactTitle.contains(input);
    }).toList();
    setState(() => contacts = results);
  }
}
