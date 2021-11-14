import 'package:flutter/material.dart';

text(String string) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
    child: Card(
      color: Colors.grey.shade700,
      child: ListTile(
        title: Text(
          string,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    ),
  );
}
