import 'package:flutter/material.dart';

countriesListWidget(String currentCountry, void Function() onTap) {
  return Card(
    color: Colors.green.shade800,
    child: ListTile(
      onTap: onTap,
      title: Text(
        '${currentCountry}',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
