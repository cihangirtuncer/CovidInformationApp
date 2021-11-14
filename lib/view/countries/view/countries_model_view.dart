import 'dart:convert';

import 'package:covid_19_statistic/core/helper/api_helper.dart';
import 'package:covid_19_statistic/core/widget/countries_list_widget_.dart';
import 'package:covid_19_statistic/core/widget/null_return_widget.dart';
import 'package:covid_19_statistic/view/countries/model/countries.dart';
import 'package:covid_19_statistic/view/statistic/view/statistic_model_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountriesModelView extends StatefulWidget {
  const CountriesModelView({Key key}) : super(key: key);

  @override
  _CountriesModelStateView createState() => _CountriesModelStateView();
}

class _CountriesModelStateView extends State<CountriesModelView> {
  Countries countries;

  @override
  void initState() {
    super.initState();
    getApi();
  }

  getApi() async {
    try {
      final response = await http.get(
        '${ApiHelper.url}countries',
        headers: ApiHelper.headers,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final _countries = Countries.fromJson(data);

        setState(() {
          countries = _countries;
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
    return countries == null
        ? circularProgressIndicator()
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (contex, index) {
              final currentCountry = countries.countryList[index];

              return countriesListWidget(currentCountry, () {
                Navigator.push(
                    conText,
                    MaterialPageRoute(
                        builder: (contex) => StatisticModelView(
                              countryName: currentCountry,
                            )));
              });
            },
            itemCount: countries.countryList?.length,
          );
  }
}
