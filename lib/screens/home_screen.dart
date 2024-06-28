import 'package:flutter/material.dart';
import 'package:test_messager_app/user_contacts.dart';

import '../features/list_contacts/list_contacts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userInherit = UserInherited.of(context);
    return ListenableBuilder(
      listenable: userInherit,
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 15,
        ),
        backgroundColor: Colors.white,
        body: ContactList(),
      ),
    );
  }
}
