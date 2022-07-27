import 'package:flutter/material.dart';
import 'package:pipocando/models/movie_genre.dart';
import 'package:pipocando/models/production_company_model.dart';

import '../core/constant.dart';

class ChipCompanies extends StatelessWidget {
  final List<ProductionCompanyModel> companies;
  final Color color;

  const ChipCompanies({
    Key? key,
    required this.companies,
    this.color = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: color.withOpacity(0.3),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      avatar: const CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Icon(
          Icons.movie,
          size: 18,
          color: Colors.white,
        ),
      ),
      label: Text(
        companies.first.name,
        textAlign: TextAlign.end,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}