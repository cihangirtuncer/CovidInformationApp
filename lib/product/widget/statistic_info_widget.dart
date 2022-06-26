import '../../core/components/text/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatisticInfoWidget extends StatelessWidget {
  final String data;
  final String dataValue;
  const StatisticInfoWidget({Key key, this.data, this.dataValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 2.h),
      child: Card(
        color: Colors.grey.shade700,
        child: ListTile(
            title: Row(
          children: [
            text(data),
            text(dataValue),
          ],
        )),
      ),
    );
  }
}
