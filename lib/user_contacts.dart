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
  List<Contact> contactList = [
    Contact(
      online: true,
      name: "Вася",
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

  void addMessageContact(Contact contact, bool my,
      [String? message, String? image, String? time]) {
    contact.messages.add(
      Message(
        image: image ?? image,
        sender: my == false ? contact.name : "my",
        message: message ?? message,
        time: time == null ? DateTime.now() : DateTime.parse(time),
      ),
    );
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
  String? message;
  String? image;
  DateTime time;
  Message(
      {required this.sender,
      required this.message,
      required this.time,
      required this.image});
}
