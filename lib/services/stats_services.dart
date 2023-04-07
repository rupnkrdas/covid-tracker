import 'dart:convert';

import 'package:covid_tracker/models/world_stats_model.dart';
import 'package:covid_tracker/services/utilities/app_urls.dart';
import 'package:http/http.dart' as http;

class StatsServices {
  Future<WorldStatsModel> fetchWorldStats() async {
    final response = await http.get(Uri.parse(AppURL.WORLD_STATS_API_URL));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return WorldStatsModel.fromMap(data);
    } else {
      throw Exception('Failed to load world stats');
    }
  }
}
