import 'package:flutter/material.dart';

class TimelineView extends StatelessWidget {
  final List<String> visitedLocations;

  TimelineView({required this.visitedLocations});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: visitedLocations.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.location_on),
          title: Text(visitedLocations[index]),
        );
      },
    );
  }
}
