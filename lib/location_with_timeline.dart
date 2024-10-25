import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'timeline_view.dart';

class LocationWithTimeline extends StatelessWidget {
  final List<String> visitedLocations = [
    "Location 1",
    "Location 2",
    "Location 3",
    "Location 4",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: LocationScreen(),  // The map screen
        ),
        Expanded(
          flex: 1,
          child: TimelineView(visitedLocations: visitedLocations),  // Timeline view
        ),
      ],
    );
  }
}
