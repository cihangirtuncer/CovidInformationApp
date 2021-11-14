import 'dart:convert';

import 'package:covid_19_statistic/core/components/app_bar/main_app_bar.dart';
import 'package:covid_19_statistic/core/helper/api_helper.dart';
import 'package:covid_19_statistic/core/widget/null_return_widget.dart';
import 'package:covid_19_statistic/view/statistic/view/statistic_view.dart';
import 'package:covid_19_statistic/view/statistic/model/statistic.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StatisticModelView extends StatefulWidget {
  final String countryName;
  const StatisticModelView({Key key, @required this.countryName})
      : super(key: key);

  @override
  _StatisticModelStateView createState() => _StatisticModelStateView();
}

class _StatisticModelStateView extends State<StatisticModelView> {
  Statistic statistic;

  @override
  void initState() {
    super.initState();
    getApi();
  }

  getApi() async {
    try {
      final response = await http.get(
        '${ApiHelper.url}statistics?country=${widget.countryName}',
        headers: ApiHelper.headers,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final _statistic = Statistic.fromJson(data);

        setState(() {
          statistic = _statistic;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$e'),
      ));
    }
  }

  @override
  Widget build(BuildContext conText) {
    return Scaffold(
        appBar: mainAppBar(widget.countryName, Colors.black),
        backgroundColor: Colors.grey.shade900,
        body: statistic == null
            ? circularProgressIndicator()
            : statisticView(response: statistic.response));
  }
}
