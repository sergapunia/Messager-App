class UserContacts {
  static List<Contact> contactList = [
    Contact(
        name: "Vasia",
        surname: "Пупкин",
        urlLogo: "assets/user_images/pupkin.jpg"),
    Contact(name: "Petia", surname: "Хрумкин"),
    Contact(name: "Стёпа", surname: "Ступкин")
  ];
}

class Contact {
  String name;
  String surname;
  String? urlLogo;
  List<Message> messages = [];
  Contact({required this.name, required this.surname, this.urlLogo});
}

class Message {
  String sender;
  String message;
  DateTime time;
  Message({required this.sender, required this.message, required this.time});
}
