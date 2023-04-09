import 'package:covid_tracker/constants/app_colors.dart';
import 'package:covid_tracker/models/world_stats_model.dart';
import 'package:covid_tracker/services/stats_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../widgets/stat_card.dart';
import '../widgets/world_stats_pie_chart.dart';
import 'countries_stats_screen.dart';

class WorldStatsScreen extends StatefulWidget {
  static String routeName = '/world-stats';
  const WorldStatsScreen({super.key});

  @override
  State<WorldStatsScreen> createState() => _WorldStatsScreenState();
}

class _WorldStatsScreenState extends State<WorldStatsScreen> {
  late List<Cases> _chartData;
  late TooltipBehavior _tooltilBehavior;
  late Future<WorldStatsModel> _worldStats;

  @override
  void initState() {
    _worldStats = StatsServices.fetchWorldStats();

    _chartData = getChartData();

    _tooltilBehavior = TooltipBehavior(enable: true);

    super.initState();
  }

  List<Cases> getChartData() {
    final List<Cases> cases = <Cases>[
      Cases('Total', 100, Colors.blue),
      Cases('Recovered', 50, Colors.green),
      Cases('Deaths', 20, Colors.red),
    ];

    return cases;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: FutureBuilder(
        future: _worldStats,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(color: const Color(0XFFD94C39)),
            );
          } else {
            _chartData = [
              Cases(
                'Today Cases',
                snapshot.data!.todayCases!,
                Colors.indigo,
              ),
              Cases(
                'Today Recovered',
                snapshot.data!.todayRecovered!,
                Colors.teal,
              ),
              Cases(
                'Today Deaths',
                snapshot.data!.todayDeaths!,
                Colors.red,
              ),
            ];
            return Column(
              children: [
                SizedBox(height: MediaQuery.of(context).viewPadding.top),

                Text(
                  'World Stats',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                // Pie-chart
                WorldStatsPieChart(
                  tooltilBehavior: _tooltilBehavior,
                  chartData: _chartData,
                ),

                // cases cards
                StatCard(label: 'Updated cases', population: snapshot.data!.updated!), // Total cases
                const SizedBox(height: 1),
                StatCard(label: 'Total Active', population: snapshot.data!.active!), // Total active
                const SizedBox(height: 1),
                StatCard(label: 'Total Recovered', population: snapshot.data!.recovered!), // Total active
                const SizedBox(height: 1),
                StatCard(label: 'Total Deaths', population: snapshot.data!.deaths!), // Total deaths
                const SizedBox(height: 1),
                StatCard(label: 'Affected Countries', population: snapshot.data!.affectedCountries!), // Total Affected Countries
                const SizedBox(height: 1),
                StatCard(label: 'Critical cases', population: snapshot.data!.critical!), // Total Critical Cases

                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Material(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: InkWell(
                          customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          onTap: () {
                            Navigator.of(context).pushNamed(CountriesListScreen.routeName);
                          },
                          child: Ink(
                            width: double.infinity,
                            height: 50,
                            // alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0XFFD94C39),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                'Track Countries',
                                style: GoogleFonts.poppins(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).viewPadding.bottom),
              ],
            );
          }
        },
      ),
    );
  }
}

class Cases {
  final String type;
  final int population;
  final Color color;

  Cases(
    this.type,
    this.population,
    this.color,
  );
}
