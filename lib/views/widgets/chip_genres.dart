import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pipocando/utils/core/constant.dart';
import 'package:pipocando/models/movie_genre.dart';

import '../../utils/core/constant.dart';

class ChipGenre extends StatelessWidget {
  final List<MovieGenre> genres;
  final Color color;

  const ChipGenre({
    Key? key,
    required this.genres,
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
          Icons.camera_roll_outlined,
          size: 18,
          color: Colors.white,
        ),
      ),
      label: Text(
        genres
            .map((e) => (e.name))
            .toString()
            .replaceAll("(", "")
            .replaceAll(")", ""),
        textAlign: TextAlign.end,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
