import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../screens/world_stats_screen.dart';

class WorldStatsPieChart extends StatelessWidget {
  const WorldStatsPieChart({
    Key? key,
    required TooltipBehavior tooltilBehavior,
    required List<Cases> chartData,
  })  : _tooltilBehavior = tooltilBehavior,
        _chartData = chartData,
        super(key: key);

  final TooltipBehavior _tooltilBehavior;
  final List<Cases> _chartData;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.85),
      child: SfCircularChart(
        legend: Legend(
          isResponsive: true,
          isVisible: true,
          position: LegendPosition.auto,
          orientation: LegendItemOrientation.horizontal,
          overflowMode: LegendItemOverflowMode.wrap,
          textStyle: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        tooltipBehavior: _tooltilBehavior,
        series: <CircularSeries>[
          // Render pie chart
          DoughnutSeries<Cases, String>(
            radius: '80',
            dataSource: _chartData,
            xValueMapper: (Cases caseType, _) => caseType.type,
            yValueMapper: (Cases caseType, _) => caseType.population,
            pointColorMapper: (caseType, index) => caseType.color,
            explode: true,
            // explodeOffset: '5%',
            strokeColor: Colors.white,
            // strokeWidth: 5,
            enableTooltip: true,
            dataLabelSettings: const DataLabelSettings(
              color: Colors.white,
              opacity: 0.8,
              alignment: ChartAlignment.center,
              isVisible: true,
              textStyle: TextStyle(
                color: Colors.black,
                fontFamily: 'Roboto',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
