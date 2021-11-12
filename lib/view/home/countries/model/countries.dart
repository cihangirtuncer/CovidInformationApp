import 'dart:convert';

class Countries {
  Countries({
    this.countryList,
  });

  List<String> countryList;

  factory Countries.fromJson(Map<String, dynamic> json) => Countries(
        countryList: List<String>.from(json["response"].map((x) => x)),
      );
}
