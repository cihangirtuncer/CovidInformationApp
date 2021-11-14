import 'package:flutter/material.dart';

countriesListWidget(String currentCountry, void Function() onTap) {
  String countries = currentCountry;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      color: Colors.grey.shade700,
      child: ListTile(
        onTap: onTap,
        title: Text(
          countries,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    ),
  );
}
