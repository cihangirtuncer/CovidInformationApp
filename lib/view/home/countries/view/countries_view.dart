import 'dart:convert';

import 'package:covid_19_statistic/view/home/countries/model/countries.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountriesView extends StatefulWidget {
  CountriesView({Key key}) : super(key: key);

  @override
  _CountriesViewState createState() => _CountriesViewState();
}

class _CountriesViewState extends State<CountriesView> {
  Countries countries;

  @override
  void initState() {
    super.initState();
    getApi();
  }

  getApi() async {
    try {
      final response = await http.get(
        'https://covid-193.p.rapidapi.com/countries',
        headers: {
          'x-rapidapi-host': 'covid-193.p.rapidapi.com',
          'x-rapidapi-key':
              '7230f0073fmsh19c10074c514c59p16793ejsn6aa0e35fe867',
        },
      );

      print(response.body);
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
        title: Text("COUNTRIES"),
      ),
      body: countries == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (contex, index) {
                final currentCountry = countries.countryList[index];

                return Card(
                  color: Colors.red.shade400,
                  child: ListTile(
                    onTap: () => {},
                    title: Text(
                      '${currentCountry}',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
              itemCount: countries.countryList?.length,
            ),
    );
  }
}
