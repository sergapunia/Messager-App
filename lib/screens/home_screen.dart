import 'package:flutter/material.dart';

import '../features/list_contacts/list_contacts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 15,
      ),
      backgroundColor: Colors.white,
      body: ContactList(),
    );
  }
}
