import 'dart:convert';

class WorldStatsModel {
  int? updated;
  int? cases;
  int? todayCases;
  int? deaths;
  int? todayDeaths;
  int? recovered;
  int? todayRecovered;
  int? active;
  int? critical;
  int? casesPerOneMillion;
  double? deathsPerOneMillion;
  int? tests;
  double? testsPerOneMillion;
  int? population;
  int? oneCasePerPeople;
  int? oneDeathPerPeople;
  int? oneTestPerPeople;
  double? activePerOneMillion;
  double? recoveredPerOneMillion;
  int? criticalPerOneMillion;
  int? affectedCountries;

  WorldStatsModel({
    this.updated,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.todayRecovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
    this.population,
    this.oneCasePerPeople,
    this.oneDeathPerPeople,
    this.oneTestPerPeople,
    this.activePerOneMillion,
    this.recoveredPerOneMillion,
    this.criticalPerOneMillion,
    this.affectedCountries,
  });

  factory WorldStatsModel.fromMap(Map<String, dynamic> data) {
    return WorldStatsModel(
      updated: data['updated'] as int?,
      cases: data['cases'] as int?,
      todayCases: data['todayCases'] as int?,
      deaths: data['deaths'] as int?,
      todayDeaths: data['todayDeaths'] as int?,
      recovered: data['recovered'] as int?,
      todayRecovered: data['todayRecovered'] as int?,
      active: data['active'] as int?,
      critical: data['critical'] as int?,
      casesPerOneMillion: data['casesPerOneMillion'] as int?,
      deathsPerOneMillion: data['deathsPerOneMillion'] as double?,
      tests: data['tests'] as int?,
      testsPerOneMillion: (data['testsPerOneMillion'] as num?)?.toDouble(),
      population: data['population'] as int?,
      oneCasePerPeople: data['oneCasePerPeople'] as int?,
      oneDeathPerPeople: data['oneDeathPerPeople'] as int?,
      oneTestPerPeople: data['oneTestPerPeople'] as int?,
      activePerOneMillion: (data['activePerOneMillion'] as num?)?.toDouble(),
      recoveredPerOneMillion: (data['recoveredPerOneMillion'] as num?)?.toDouble(),
      criticalPerOneMillion: data['criticalPerOneMillion'] as int?,
      affectedCountries: data['affectedCountries'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'updated': updated,
        'cases': cases,
        'todayCases': todayCases,
        'deaths': deaths,
        'todayDeaths': todayDeaths,
        'recovered': recovered,
        'todayRecovered': todayRecovered,
        'active': active,
        'critical': critical,
        'casesPerOneMillion': casesPerOneMillion,
        'deathsPerOneMillion': deathsPerOneMillion,
        'tests': tests,
        'testsPerOneMillion': testsPerOneMillion,
        'population': population,
        'oneCasePerPeople': oneCasePerPeople,
        'oneDeathPerPeople': oneDeathPerPeople,
        'oneTestPerPeople': oneTestPerPeople,
        'activePerOneMillion': activePerOneMillion,
        'recoveredPerOneMillion': recoveredPerOneMillion,
        'criticalPerOneMillion': criticalPerOneMillion,
        'affectedCountries': affectedCountries,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [WorldStatsModel].
  factory WorldStatsModel.fromJson(String data) {
    return WorldStatsModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [WorldStatsModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
