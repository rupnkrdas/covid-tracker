class AppURL {
  // base url
  static const String baseURL = 'https://disease.sh/v3/covid-19';

  // fetch world stats
  static const String worldStatsApiURL = '$baseURL/all';

  // fetch countries stats
  static const String countriesStatsApiURL = '$baseURL/countries';
}
