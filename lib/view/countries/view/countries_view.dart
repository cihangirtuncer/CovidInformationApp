import '../../../core/components/app_bar/main_app_bar.dart';
import '../viewModel/countries_view_model.dart';
import 'package:flutter/material.dart';

class CountriesView extends StatelessWidget {
  const CountriesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: mainAppBar(
          "Countries",
          Colors.black,
        ),
        body: const CountriesViewModel());
  }
}
