import 'package:flutter/material.dart';

Widget searchBar(TextEditingController controller, searchChats) {
  return Container(
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
      ],
    ),
  );
}
