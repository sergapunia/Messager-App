import 'package:flutter/material.dart';

import '../../../user_contacts.dart';

Widget bottomBar(Contact contact) {
  return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leftIcon(),
          Expanded(
            flex: 3,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromRGBO(237, 242, 246, 1),
                hintStyle:
                    const TextStyle(color: Color(0xFFA1A5C0), fontSize: 16),
                hintText: "Сообщение",
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color.fromRGBO(237, 242, 246, 1)),
                  borderRadius: BorderRadius.circular(15),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color.fromRGBO(237, 242, 246, 1)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          rightIcon(),
        ],
      ));
}

Widget leftIcon() {
  return Container(
    child: IconButton(
      style: ButtonStyle(
          shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          backgroundColor:
              WidgetStateProperty.all(Color.fromRGBO(237, 242, 246, 1))),
      onPressed: () {},
      icon: Icon(Icons.attach_file_rounded),
    ),
  );
}

Widget rightIcon() {
  return Container(
    child: IconButton(
      style: ButtonStyle(
          shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          backgroundColor:
              WidgetStateProperty.all(Color.fromRGBO(237, 242, 246, 1))),
      onPressed: () {},
      icon: Icon(Icons.mic_none),
    ),
  );
}
