import 'package:flutter/material.dart';

statisticInfo(
    {List<Widget> children, Widget subtitle, Widget leading, Widget trailing}) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start, children: children);
}
