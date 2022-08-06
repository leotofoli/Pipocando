import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pipocando/utils/core/constant.dart';

import '../../utils/core/constant.dart';

class ChipLanguage extends StatelessWidget {
  final String language;
  final Color color;

  const ChipLanguage(
      {Key? key, required this.language, this.color = Colors.red})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: color.withOpacity(0.3),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      avatar: const CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Icon(
          Icons.language,
          size: 18,
          color: Colors.white,
        ),
      ),
      label: Text(
        language.toUpperCase(),
        textAlign: TextAlign.end,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
