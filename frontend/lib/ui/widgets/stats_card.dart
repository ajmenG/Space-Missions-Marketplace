// lib/ui/widgets/stats_card.dart
import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  final String label;
  final int count;

  const StatsCard({Key? key, required this.label, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        Text(count.toString(), style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}
