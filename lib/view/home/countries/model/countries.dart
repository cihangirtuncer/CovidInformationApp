import 'dart:convert';

Countries countriesFromJson(String str) => Countries.fromJson(json.decode(str));

String countriesToJson(Countries data) => json.encode(data.toJson());

class Countries {
  Countries({
    this.countriesGet,
    this.parameters,
    this.errors,
    this.results,
    this.response,
  });

  String countriesGet;
  List<dynamic> parameters;
  List<dynamic> errors;
  int results;
  List<String> response;

  factory Countries.fromJson(Map<String, dynamic> json) => Countries(
        countriesGet: json["get"],
        parameters: List<dynamic>.from(json["parameters"].map((x) => x)),
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        results: json["results"],
        response: List<String>.from(json["response"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "get": countriesGet,
        "parameters": List<dynamic>.from(parameters.map((x) => x)),
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "results": results,
        "response": List<dynamic>.from(response.map((x) => x)),
      };
}
