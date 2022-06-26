import '../../../core/components/app_bar/main_app_bar.dart';
import '../model/statistic_model.dart';
import 'package:flutter/material.dart';

import '../../../product/widget/statistic_info_widget.dart';

class StaticView extends StatelessWidget {
  final Response response;
  final String countryName;
  const StaticView({Key key, this.response, this.countryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(countryName, Colors.black),
      backgroundColor: Colors.grey.shade900,
      body: statisticView(response: response),
    );
  }
}

statisticView({
  @required Response response,
}) {
  final currentCaseStatistic = response.cases;
  final currentCountryStatistic = response.country;
  final currentTestsStatistic = response.tests;
  final currentPopulationStatistic = response.population;
  final currentContinentStatistic = response.continent;
  final currentDayStatistic = response.day;
  final currentDeathsStatistic = response.deaths;

  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StatisticInfoWidget(
            data: "Number of active cases: ",
            dataValue: currentCaseStatistic.active.toString() ?? ""),
        StatisticInfoWidget(
            data: "Number of critical cases: ",
            dataValue: currentCaseStatistic.critical.toString() ?? ""),
        StatisticInfoWidget(
            data: "Number of new cases: ",
            dataValue: currentCaseStatistic.casesNew.toString() ?? ""),
        StatisticInfoWidget(
            data: "Number of recovered cases: ",
            dataValue: currentCaseStatistic.recovered.toString() ?? ""),
        StatisticInfoWidget(
            data: "Number of the1MPop cases: ",
            dataValue: currentCaseStatistic.the1MPop.toString() ?? ""),
        StatisticInfoWidget(
            data: "Number of total cases: ",
            dataValue: currentCaseStatistic.total.toString() ?? ""),
        StatisticInfoWidget(
          data: "Country: ",
          dataValue: currentCountryStatistic.toString() ?? "",
        ),
        StatisticInfoWidget(
          data: "Number of the1MPop cases: ",
          dataValue: currentTestsStatistic.the1MPop.toString() ?? "",
        ),
        StatisticInfoWidget(
          data: "Population: ",
          dataValue: currentPopulationStatistic.toString() ?? "",
        ),
        StatisticInfoWidget(
          data: "Continent: ",
          dataValue: currentContinentStatistic.name.toString() ?? "",
        ),
        StatisticInfoWidget(
          data: "Datatime: ",
          dataValue: currentDayStatistic.toString() ?? "",
        ),
        StatisticInfoWidget(
          data: "Death: ",
          dataValue: currentDeathsStatistic.deathsNew.toString() ?? 0 ?? "",
        ),
        StatisticInfoWidget(
            data: "Number of tests: ",
            dataValue: currentTestsStatistic.total.toString() ?? ""),
        StatisticInfoWidget(
            data: "Number of deaths the1MPop: ",
            dataValue: currentDeathsStatistic.the1MPop.toString() ?? ""),
        StatisticInfoWidget(
          data: "Number of total deaths : ",
          dataValue: currentDeathsStatistic.total.toString() ?? "",
        ),
      ],
    ),
  );
}
