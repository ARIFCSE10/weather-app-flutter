import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: TextField(
        style: const TextStyle(color: Colors.black),
        maxLines: 1,
        controller: TextEditingController(),
        decoration: const InputDecoration(
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          icon: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          hintText: "City, Country",
        ),
        onSubmitted: (value) {},
      ),
    );
  }
}
