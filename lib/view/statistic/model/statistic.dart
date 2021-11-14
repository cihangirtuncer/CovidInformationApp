class Statistic {
  Statistic({
    this.response,
  });

  Response response;

  factory Statistic.fromJson(Map<String, dynamic> json) =>
      Statistic(response: Response.fromJson(json["response"][0]));
}

class Response {
  Response({
    this.continent,
    this.country,
    this.population,
    this.cases,
    this.deaths,
    this.tests,
    this.day,
    this.time,
  });

  Continent continent;
  String country;
  int population;
  Cases cases;
  Deaths deaths;
  Tests tests;
  DateTime day;
  DateTime time;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        continent: json["continent"] == null
            ? null
            : continentValues.map[json["continent"]],
        country: json["country"],
        population: json["population"],
        cases: Cases.fromJson(json["cases"]),
        deaths: Deaths.fromJson(json["deaths"]),
        tests: Tests.fromJson(json["tests"]),
        day: DateTime.parse(json["day"]),
        time: DateTime.parse(json["time"]),
      );

  Map<String, dynamic> toJson() => {
        "continent":
            continent == null ? null : continentValues.reverse[continent],
        "country": country,
        "population": population,
        "cases": cases.toJson(),
        "deaths": deaths.toJson(),
        "tests": tests.toJson(),
        "day":
            "${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}",
        "time": time.toIso8601String(),
      };
}

class Cases {
  Cases({
    this.casesNew,
    this.active,
    this.critical,
    this.recovered,
    this.the1MPop,
    this.total,
  });

  String casesNew;
  int active;
  int critical;
  int recovered;
  String the1MPop;
  int total;

  factory Cases.fromJson(Map<String, dynamic> json) => Cases(
        casesNew: json["new"],
        active: json["active"],
        critical: json["critical"],
        recovered: json["recovered"],
        the1MPop: json["1M_pop"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "new": casesNew,
        "active": active,
        "critical": critical,
        "recovered": recovered,
        "1M_pop": the1MPop,
        "total": total,
      };
}

enum Continent {
  // ignore: constant_identifier_names
  AFRICA,
  // ignore: constant_identifier_names
  ASIA,
  // ignore: constant_identifier_names
  SOUTH_AMERICA,
  // ignore: constant_identifier_names
  NORTH_AMERICA,
  // ignore: constant_identifier_names
  OCEANIA,
  // ignore: constant_identifier_names
  EUROPE,
  // ignore: constant_identifier_names
  ALL
}

final continentValues = EnumValues({
  "Africa": Continent.AFRICA,
  "All": Continent.ALL,
  "Asia": Continent.ASIA,
  "Europe": Continent.EUROPE,
  "North-America": Continent.NORTH_AMERICA,
  "Oceania": Continent.OCEANIA,
  "South-America": Continent.SOUTH_AMERICA
});

class Deaths {
  Deaths({
    this.deathsNew,
    this.the1MPop,
    this.total,
  });

  String deathsNew;
  String the1MPop;
  int total;

  factory Deaths.fromJson(Map<String, dynamic> json) => Deaths(
        deathsNew: json["new"],
        the1MPop: json["1M_pop"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "new": deathsNew,
        "1M_pop": the1MPop,
        "total": total,
      };
}

class Tests {
  Tests({
    this.the1MPop,
    this.total,
  });

  String the1MPop;
  int total;

  factory Tests.fromJson(Map<String, dynamic> json) => Tests(
        the1MPop: json["1M_pop"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "1M_pop": the1MPop,
        "total": total,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    // ignore: prefer_conditional_assignment
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}
