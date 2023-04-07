import 'package:covid_tracker/services/stats_services.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Models/world_stats_model.dart';
import '../widgets/stat_card.dart';
import '../widgets/world_stats_pie_chart.dart';

class WorldStatsScreen extends StatefulWidget {
  const WorldStatsScreen({super.key});

  @override
  State<WorldStatsScreen> createState() => _WorldStatsScreenState();
}

class _WorldStatsScreenState extends State<WorldStatsScreen> {
  late List<Cases> _chartData;
  late TooltipBehavior _tooltilBehavior;

  @override
  void initState() {
    super.initState();
    _chartData = getChartData();
    _tooltilBehavior = TooltipBehavior(enable: true);
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
    StatsServices statsServices = StatsServices();

    return Scaffold(
      body: FutureBuilder(
        future: statsServices.fetchWorldStats(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            _chartData = [
              Cases(
                'Today Cases',
                snapshot.data!.todayCases!,
                Colors.blue,
              ),
              Cases(
                'Today Recovered',
                snapshot.data!.todayRecovered!,
                Colors.green,
              ),
              Cases(
                'Today Deaths',
                snapshot.data!.todayDeaths!,
                Colors.red,
              ),
            ];
            return Column(
              children: [
                // Pie-chart
                WorldStatsPieChart(
                  tooltilBehavior: _tooltilBehavior,
                  chartData: _chartData,
                ),

                // cases cards
                StatCard(label: 'Total Active', population: snapshot.data!.active!), // Total active
                StatCard(label: 'Total Recovered', population: snapshot.data!.recovered!), // Total active
                StatCard(label: 'Total Deaths', population: snapshot.data!.deaths!), // Total deaths
                StatCard(label: 'Affected Countries', population: snapshot.data!.affectedCountries!), // Total Affected Countries

                // Track Countries button
                ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                  onPressed: () {},
                  child: const Text('Track Countries'),
                ),
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
