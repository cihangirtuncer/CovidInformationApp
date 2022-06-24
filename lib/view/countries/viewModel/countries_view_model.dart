import 'package:covid_19_statistic/product/constant/get_storage.dart';
import 'package:covid_19_statistic/view/countries/model/countries.dart';
import 'package:covid_19_statistic/view/countries/service/countries_service.dart';
import 'package:covid_19_statistic/view/statistic/viewModel/statistic_view_model.dart';
import 'package:flutter/material.dart';

import '../../../product/widget/countries_list_widget_.dart';
import '../../../product/widget/null_return_widget.dart';

class CountriesViewModel extends StatefulWidget {
  const CountriesViewModel({Key key}) : super(key: key);

  @override
  _CountriesModelStateView createState() => _CountriesModelStateView();
}

class _CountriesModelStateView extends State<CountriesViewModel> {
  Countries countries;

  @override
  Widget build(BuildContext context) {
    final countriesData = CountriesService().getCountries();
    return countriesData == null
        ? circularProgressIndicator()
        : FutureBuilder(
            future: countriesData,
            builder: (context, snapshot) {
              return Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: box.read("key"),
                          itemBuilder: (context, index) {
                            return countriesListWidget(snapshot.data[index],
                                () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (contex) => StatisticViewModel(
                                            countryName: snapshot.data[index],
                                          )));
                            });
                          })),
                ],
              );
            });
  }
}
