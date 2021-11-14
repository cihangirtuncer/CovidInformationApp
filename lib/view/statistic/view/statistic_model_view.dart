import 'dart:convert';

import 'package:covid_19_statistic/core/components/app_bar/main_app_bar.dart';
import 'package:covid_19_statistic/core/components/text/text.dart';
import 'package:covid_19_statistic/core/widget/null_return_widget.dart';
import 'package:covid_19_statistic/core/widget/statistic_info.dart';
import 'package:covid_19_statistic/view/statistic/model/statistic.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StatisticModelView extends StatefulWidget {
  const StatisticModelView({Key key}) : super(key: key);

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
        'https://covid-193.p.rapidapi.com/statistics',
        headers: {
          'x-rapidapi-host': 'covid-193.p.rapidapi.com',
          'x-rapidapi-key':
              '7230f0073fmsh19c10074c514c59p16793ejsn6aa0e35fe867',
        },
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
      appBar: mainAppBar("Country", Colors.green.shade900),
      backgroundColor: Colors.green,
      body: statistic == null
          ? circularProgressIndicator()
          : ListView.builder(
              itemBuilder: (contex, index) {
                final currentCaseStatistic = statistic.response[index].cases;
                final currentContinentStatistic =
                    statistic.response[index].continent;
                final currentCountryStatistic =
                    statistic.response[index].country;
                final currentDayStatistic = statistic.response[index].day;
                final currentDeathsStatistic = statistic.response[index].deaths;
                final currentPopulationStatistic =
                    statistic.response[index].population;
                final currentTestsStatistic = statistic.response[index].tests;
                final currentTimeStatistic = statistic.response[index].time;

                return statisticInfo(
                  children: [
                    text(
                      "number of active cases: ${currentCaseStatistic.active.toString()}" ??
                          "",
                    ),
                    text(
                        "Number of critical cases: ${currentCaseStatistic.critical.toString()}" ??
                            ""),
                    text(
                        "number of new cases cases ${currentCaseStatistic.casesNew.toString()}" ??
                            ""),
                    text(
                        "number of recovered cases: ${currentCaseStatistic.recovered.toString()}" ??
                            ""),
                    text(
                        "number of the1MPop cases: ${currentCaseStatistic.the1MPop.toString()}" ??
                            ""),
                    text(
                        "number of total cases: ${currentCaseStatistic.total.toString()}" ??
                            ""),
                    text(
                      "Country: $currentCountryStatistic" ?? "",
                    ),
                    text(
                      "number of the1MPop cases: ${currentTestsStatistic.the1MPop}" ??
                          "",
                    ),
                    text(
                      "Population: ${currentPopulationStatistic.toString()}" ??
                          "",
                    ),
                    text(
                      " ${currentContinentStatistic.toString()}" ?? "",
                    ),
                    text(
                      "Datatime: ${currentDayStatistic.toString()}" ?? "",
                    ),
                    text(
                      "Death: ${currentDeathsStatistic.deathsNew}" ?? "",
                    ),
                    text(
                        "Number of tests: ${currentTestsStatistic.total.toString()}" ??
                            ""),
                    text(
                        "Number of deaths the1MPop: ${currentDeathsStatistic.the1MPop}" ??
                            ""),
                    text(
                      "Number of total deaths : ${currentDeathsStatistic.total.toString()}" ??
                          "",
                    ),
                    const SizedBox(
                      width: 20,
                      height: 100,
                    )
                  ],
                );
              },
              itemCount: statistic.response?.length,
            ),
    );
  }
}
