import 'package:flutter/material.dart';

statisticListTile(
    {Widget title, Widget subtitle, Widget leading, Widget trailing}) {
  return ListTile(
    title: title,
    subtitle: subtitle,
    leading: leading,
    trailing: trailing,
  );
}
