class UserContacts {
  static List<Contact> contactList = [
    Contact(
        online: true,
        name: "Вася",
        surname: "Пупкин",
        urlLogo: "assets/user_images/pupkin.jpg"),
    Contact(online: false, name: "Петя", surname: "Хрумкин"),
    Contact(online: false, name: "Стёпа", surname: "Ступкин")
  ];
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
