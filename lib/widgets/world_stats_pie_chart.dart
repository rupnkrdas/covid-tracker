import 'package:flutter/material.dart';
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
    return SfCircularChart(
      legend: Legend(
        isVisible: true,
        position: LegendPosition.right,
        overflowMode: LegendItemOverflowMode.wrap,
      ),
      tooltipBehavior: _tooltilBehavior,
      series: <CircularSeries>[
        // Render pie chart
        PieSeries<Cases, String>(
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
            alignment: ChartAlignment.center,
            isVisible: true,
            textStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
              fontSize: 15,
            ),
            labelIntersectAction: LabelIntersectAction.shift,
            overflowMode: OverflowMode.shift,
          ),
        ),
      ],
    );
  }
}
