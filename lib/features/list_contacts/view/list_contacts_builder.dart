import 'package:flutter/material.dart';
import 'package:test_messager_app/features/list_contacts/widgets/search_bar.dart';
import 'package:test_messager_app/user_contacts.dart';
import '../widgets/contact_card.dart';

class ContactList extends StatefulWidget {
  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final controller = TextEditingController();

  List<Contact> contacts = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final userInherit = UserInherited.of(context);
    contacts = userInherit.contactList;
  }

  @override
  Widget build(BuildContext context) {
    final userInherit = UserInherited.of(context);
    return ListenableBuilder(
        listenable: userInherit,
        builder: (context, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              searchBar(controller, (String title) {
                List<Contact> result = [];
                if (title.isEmpty) {
                  result = userInherit.contactList;
                } else {
                  result = contacts.where((contact) {
                    return (contact.name + contact.surname)
                        .toLowerCase()
                        .contains(title.toLowerCase());
                  }).toList();
                }
                contacts = result;
                setState(() => contacts = result);
              }),
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
        });
  }
}
