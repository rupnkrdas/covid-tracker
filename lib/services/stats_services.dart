import 'dart:convert';

import 'package:covid_tracker/models/world_stats_model.dart';
import 'package:covid_tracker/constants/app_urls.dart';
import 'package:http/http.dart' as http;

import '../models/country_stats_model/country_stats_model.dart';

class StatsServices {
  static Future<WorldStatsModel> fetchWorldStats() async {
    final response = await http.get(Uri.parse(AppURL.worldStatsApiURL));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return WorldStatsModel.fromMap(data);
    } else {
      throw Exception('Failed to load world stats');
    }
  }

  static Future<List<CountryStatsModel>> fetchCountryStats() async {
    List<CountryStatsModel> countriesList = [];
    final response = await http.get(Uri.parse(AppURL.countriesStatsApiURL));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      for (var country in data) {
        countriesList.add(CountryStatsModel.fromMap(country));
      }
      return countriesList;
    } else {
      throw Exception('Failed to load country stats');
    }
  }
}
