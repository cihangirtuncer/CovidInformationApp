import 'package:flutter/material.dart';

countriesListWidget(String currentCountry, void Function() onTap) {
  String countries = currentCountry;
  return Card(
    color: Colors.green.shade800,
    child: ListTile(
      onTap: onTap,
      title: Text(
        countries,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
