import 'package:covid_19_statistic/core/components/app_bar/main_app_bar.dart';
import 'package:covid_19_statistic/view/countries/view/countries_model_view.dart';
import 'package:flutter/material.dart';

class CountriesView extends StatelessWidget {
  const CountriesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: mainAppBar(
          "COUNTRIES",
          Colors.green.shade900,
        ),
        body: const CountriesModelView());
  }
}
