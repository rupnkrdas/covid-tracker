import 'package:covid_tracker/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:covid_tracker/models/country_stats_model/country_stats_model.dart';
import 'package:covid_tracker/services/stats_services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/country_stats_card.dart';
import '../widgets/custom_shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  static String routeName = '/countries-stats';
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  late TextEditingController _searchController = TextEditingController();
  late Future<List<CountryStatsModel>> _countriesList;

  @override
  void initState() {
    _searchController = TextEditingController();

    // get countries list
    _countriesList = StatsServices.fetchCountryStats();

    super.initState();
  }

  @override
  dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top),

            // choose-your-country
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Choose your country',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // search-bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(color: Colors.grey.shade400.withOpacity(0.5), borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 15,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      cursorColor: Colors.black,
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: ' Search...',
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: FutureBuilder(
                future: _countriesList,
                builder: (context, snapshot) {
                  // snapshot has no data
                  if (!snapshot.hasData) {
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return const CustomShimmer();
                      },
                    );
                  } else {
                    // snapshot has data
                    List<CountryStatsModel> countryStatsList = snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      addAutomaticKeepAlives: false,
                      addRepaintBoundaries: false,
                      itemCount: countryStatsList.length,
                      itemBuilder: (context, index) {
                        String countryName = countryStatsList[index].countryName!;

                        if (_searchController.text.isEmpty) {
                          return CountryStatsCard(
                            countryName: countryStatsList[index].countryName!,
                            flag: countryStatsList[index].countryInfo!.flag!,
                            cases: countryStatsList[index].cases!,
                          );
                        } else if (countryName.toLowerCase().contains(_searchController.text.toLowerCase())) {
                          return CountryStatsCard(
                            countryName: countryStatsList[index].countryName!,
                            flag: countryStatsList[index].countryInfo!.flag!,
                            cases: countryStatsList[index].cases!,
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                },
              ),
            ),
            Align(alignment: Alignment.bottomCenter, child: SizedBox(height: MediaQuery.of(context).viewPadding.bottom)),
          ],
        ),
      ),
    );
  }
}
