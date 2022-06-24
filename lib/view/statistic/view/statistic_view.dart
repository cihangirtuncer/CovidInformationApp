import 'package:covid_19_statistic/core/components/app_bar/main_app_bar.dart';
import 'package:covid_19_statistic/core/components/text/text.dart';
import 'package:covid_19_statistic/view/statistic/model/statistic.dart';
import 'package:flutter/material.dart';

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
        text(
          "Number of active cases: ${currentCaseStatistic.active.toString()}" ??
              "",
        ),
        text(
            "Number of critical cases: ${currentCaseStatistic.critical.toString()}" ??
                ""),
        text(
            "Number of new cases ${currentCaseStatistic.casesNew.toString()}" ??
                ""),
        text(
            "Number of recovered cases: ${currentCaseStatistic.recovered.toString()}" ??
                ""),
        text(
            "Number of the1MPop cases: ${currentCaseStatistic.the1MPop.toString()}" ??
                ""),
        text(
            "Number of total cases: ${currentCaseStatistic.total.toString()}" ??
                ""),
        text(
          "Country: $currentCountryStatistic" ?? "",
        ),
        text(
          "Number of the1MPop cases: ${currentTestsStatistic.the1MPop}" ?? "",
        ),
        text(
          "Population: ${currentPopulationStatistic.toString()}" ?? "",
        ),
        text(
          currentContinentStatistic.toString() ?? "",
        ),
        text(
          "Datatime: ${currentDayStatistic.toString()}" ?? "",
        ),
        text(
          "Death: ${currentDeathsStatistic.deathsNew}" ?? "",
        ),
        text(
            "Number of tests: ${currentTestsStatistic.total.toString()}" ?? ""),
        text("Number of deaths the1MPop: ${currentDeathsStatistic.the1MPop}" ??
            ""),
        text(
          "Number of total deaths : ${currentDeathsStatistic.total.toString()}" ??
              "",
        ),
      ],
    ),
  );
}
