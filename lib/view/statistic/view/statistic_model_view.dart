import 'dart:convert';

import 'package:covid_19_statistic/core/components/listtile_dart/statistic_info_listtile.dart';
import 'package:covid_19_statistic/core/components/text/text.dart';
import 'package:covid_19_statistic/core/widget/null_return_widget.dart';
import 'package:covid_19_statistic/core/widget/statistic_info.dart';
import 'package:covid_19_statistic/view/statistic/model/statistic.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StatisticModelView extends StatefulWidget {
  StatisticModelView({Key key}) : super(key: key);

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
  Widget build(BuildContext context) {
    return statistic == null
        ? nullReturn()
        : ListView.builder(
            itemBuilder: (contex, index) {
              final currentCaseStatistic = statistic.response[index].cases;
              final currentContinentStatistic =
                  statistic.response[index].continent;
              final currentCountryStatistic = statistic.response[index].country;
              final currentDayStatistic = statistic.response[index].day;
              final currentDeathsStatistic = statistic.response[index].deaths;
              final currentPopulationStatistic =
                  statistic.response[index].population;
              final currentTestsStatistic = statistic.response[index].tests;
              final currentTimeStatistic = statistic.response[index].time;

              return statisticInfo(
                [
                  statisticListTile(
                    title: Column(
                      children: [
                        text(currentCaseStatistic.active.toString()),
                        text(currentCaseStatistic.critical.toString()),
                        text(currentCaseStatistic.casesNew.toString()),
                        text(currentCaseStatistic.recovered.toString()),
                        text(currentCaseStatistic.the1MPop.toString()),
                        text(currentCaseStatistic.total.toString())
                      ],
                    ),
                  ),
                  statisticListTile(
                      title: text(currentTimeStatistic.isUtc.toString())),
                  statisticListTile(title: text(currentCountryStatistic)),
                  statisticListTile(
                      title: Column(
                    children: [
                      text(currentTestsStatistic.the1MPop),
                      text(currentTestsStatistic.total.toString()),
                    ],
                  )),
                  statisticListTile(
                      title: Column(
                    children: [
                      text(currentDeathsStatistic.deathsNew),
                      text(currentDeathsStatistic.the1MPop),
                      text(
                        currentDeathsStatistic.total.toString(),
                      ),
                    ],
                  )),
                  statisticListTile(
                    title: text(
                      currentPopulationStatistic.toString(),
                    ),
                  ),
                  statisticListTile(
                    title: text(
                      currentContinentStatistic.toString(),
                    ),
                  ),
                  statisticListTile(
                    title: text(
                      currentDayStatistic.toString(),
                    ),
                  )
                ],
              );
            },
            itemCount: statistic.response?.length,
          );
  }
}
