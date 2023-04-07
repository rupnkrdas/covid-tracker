import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String label;
  final int population;

  const StatCard({
    super.key,
    required this.label,
    required this.population,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      height: 50,
      // margin: ,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(population.toString()),
        ],
      ),
    );
  }
}
