import 'dart:convert';

Statistic statisticFromJson(String str) => Statistic.fromJson(json.decode(str));

String statisticToJson(Statistic data) => json.encode(data.toJson());

class Statistic {
  Statistic({
    this.statisticGet,
    this.parameters,
    this.errors,
    this.results,
    this.response,
  });

  String statisticGet;
  Parameters parameters;
  List<dynamic> errors;
  int results;
  List<Response> response;

  factory Statistic.fromJson(Map<String, dynamic> json) => Statistic(
        statisticGet: json["get"],
        parameters: Parameters.fromJson(json["parameters"]),
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        results: json["results"],
        response: List<Response>.from(
            json["response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "get": statisticGet,
        "parameters": parameters.toJson(),
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "results": results,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Parameters {
  Parameters({
    this.country,
  });

  String country;

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
      };
}

class Response {
  Response();

  factory Response.fromJson(Map<String, dynamic> json) => Response();

  Map<String, dynamic> toJson() => {};
}
