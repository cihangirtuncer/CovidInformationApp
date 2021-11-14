import 'package:covid_19_statistic/core/components/text/text.dart';
import 'package:covid_19_statistic/view/statistic/model/statistic.dart';
import 'package:flutter/material.dart';

statisticInfo({
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
          "number of the1MPop cases: ${currentTestsStatistic.the1MPop}" ?? "",
        ),
        text(
          "Population: ${currentPopulationStatistic.toString()}" ?? "",
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
