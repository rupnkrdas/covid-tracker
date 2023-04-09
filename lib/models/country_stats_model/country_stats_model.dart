import 'dart:convert';

import 'country_info.dart';

class CountryStatsModel {
  int? updated;
  String? countryName;
  CountryInfo? countryInfo;
  int? cases;
  int? todayCases;
  int? deaths;
  int? todayDeaths;
  int? recovered;
  int? todayRecovered;
  int? active;
  int? critical;
  int? casesPerOneMillion;
  int? deathsPerOneMillion;
  int? tests;
  int? testsPerOneMillion;
  int? population;
  String? continent;
  int? oneCasePerPeople;
  int? oneDeathPerPeople;
  int? oneTestPerPeople;
  double? activePerOneMillion;
  double? recoveredPerOneMillion;
  double? criticalPerOneMillion;

  CountryStatsModel({
    this.updated,
    this.countryName,
    this.countryInfo,
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
    this.continent,
    this.oneCasePerPeople,
    this.oneDeathPerPeople,
    this.oneTestPerPeople,
    this.activePerOneMillion,
    this.recoveredPerOneMillion,
    this.criticalPerOneMillion,
  });

  factory CountryStatsModel.fromMap(Map<String, dynamic> data) {
    return CountryStatsModel(
      updated: data['updated'] as int?,
      countryName: data['country'] as String?,
      countryInfo: data['countryInfo'] == null ? null : CountryInfo.fromMap(data['countryInfo'] as Map<String, dynamic>),
      cases: data['cases'] as int?,
      todayCases: data['todayCases'] as int?,
      deaths: data['deaths'] as int?,
      todayDeaths: data['todayDeaths'] as int?,
      recovered: data['recovered'] as int?,
      todayRecovered: data['todayRecovered'] as int?,
      active: data['active'] as int?,
      critical: data['critical'] as int?,
      casesPerOneMillion: data['casesPerOneMillion'] as int?,
      deathsPerOneMillion: data['deathsPerOneMillion'] as int?,
      tests: data['tests'] as int?,
      testsPerOneMillion: data['testsPerOneMillion'] as int?,
      population: data['population'] as int?,
      continent: data['continent'] as String?,
      oneCasePerPeople: data['oneCasePerPeople'] as int?,
      oneDeathPerPeople: data['oneDeathPerPeople'] as int?,
      oneTestPerPeople: data['oneTestPerPeople'] as int?,
      activePerOneMillion: (data['activePerOneMillion'] as num?)?.toDouble(),
      recoveredPerOneMillion: (data['recoveredPerOneMillion'] as num?)?.toDouble(),
      criticalPerOneMillion: (data['criticalPerOneMillion'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toMap() => {
        'updated': updated,
        'country': countryName,
        'countryInfo': countryInfo?.toMap(),
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
        'continent': continent,
        'oneCasePerPeople': oneCasePerPeople,
        'oneDeathPerPeople': oneDeathPerPeople,
        'oneTestPerPeople': oneTestPerPeople,
        'activePerOneMillion': activePerOneMillion,
        'recoveredPerOneMillion': recoveredPerOneMillion,
        'criticalPerOneMillion': criticalPerOneMillion,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CountryStatsModel].
  factory CountryStatsModel.fromJson(String data) {
    return CountryStatsModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CountryStatsModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
