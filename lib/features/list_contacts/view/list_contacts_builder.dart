import 'package:flutter/material.dart';
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
        Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Чаты",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600)),
              TextField(
                controller: controller,
                onChanged: searchChats,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(237, 242, 246, 1),
                  hintStyle: const TextStyle(color: Color(0xFFA1A5C0), fontSize: 16),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 40,
                    color: Color(0xFFA1A5C0),
                  ),
                  hintText: "Поиск",
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(237, 242, 246, 1)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(237, 242, 246, 1)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ],
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
