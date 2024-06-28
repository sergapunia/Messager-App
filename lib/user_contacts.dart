import 'package:flutter/material.dart';

class UserInherited extends InheritedWidget {
  final UserContactsService contactsServise;
  UserInherited({required this.contactsServise, required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(UserInherited oldWidget) {
    return oldWidget.contactsServise != contactsServise;
  }

  static UserContactsService of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<UserInherited>()!
        .contactsServise;
  }
}

class UserContactsService extends ChangeNotifier {
  Contact? activeMessageContact;
  List<Contact> searchList = [];
  List<Contact> contactList = [
    Contact(
      online: true,
      name: "vasia",
      surname: "Пупкин",
      urlLogo: "assets/user_images/pupkin.jpg",
    ),
    Contact(online: false, name: "Петя", surname: "Хрумкин"),
    Contact(online: false, name: "Стёпа", surname: "Ступкин")
  ];

  void addContact(Contact contact) {
    contactList.add(contact);
    notifyListeners();
  }

  void activeContact(Contact contact) {
    activeMessageContact = contact;
    notifyListeners();
  }

  void addMessageContact(Contact contact, String message, bool my) {
    contact.messages.add(Message(
        sender: my == false ? contact.name : "my",
        message: message,
        time: DateTime.now()));
    notifyListeners();
  }

  void changeContacts(List<Contact> contacts) {
    searchList = contacts;
    notifyListeners();
  }
}

class Contact {
  bool online;
  String name;
  String surname;
  String? urlLogo;
  List<Message> messages = [];
  Contact(
      {required this.name,
      required this.surname,
      this.urlLogo,
      required this.online});
}

class Message {
  String sender;
  String message;
  DateTime time;
  Message({required this.sender, required this.message, required this.time});
}
