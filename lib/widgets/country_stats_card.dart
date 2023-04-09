// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid_tracker/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountryStatsCard extends StatelessWidget {
  final String countryName;
  final String flag;
  final int cases;

  const CountryStatsCard({
    Key? key,
    required this.countryName,
    required this.flag,
    required this.cases,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      padding: const EdgeInsets.symmetric(vertical: 5),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 80,
            height: double.maxFinite,
            child: CachedNetworkImage(
              imageUrl: flag,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(child: Container(color: AppColors.shimmerBaseColor)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                countryName,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(cases.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
