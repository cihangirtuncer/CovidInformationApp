import 'package:flutter/material.dart';

Text text(String string) {
  return  Text(
          string ?? 0,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        );
}
