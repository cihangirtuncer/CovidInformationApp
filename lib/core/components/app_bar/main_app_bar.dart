import 'package:flutter/material.dart';

AppBar mainAppBar(String title, Color color) {
  return AppBar(
    centerTitle: true,
    backgroundColor: color,
    title: Text(
      title,
      style: const TextStyle(color: Colors.amber, fontSize: 25),
    ),
  );
}
