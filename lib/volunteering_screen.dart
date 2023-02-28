import 'package:flutter/material.dart';

class VolunteeringScreen extends StatelessWidget {
  final List<String> volunteerOpportunities = [    'Serve meals at a homeless shelter',    'Plant trees in the community park',    'Mentor a student in need',    'Clean up the local beach',    'Help organize a charity fundraiser'  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Volunteering Opportunities'),
      ),
      body: ListView.builder(
        itemCount: volunteerOpportunities.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(volunteerOpportunities[index]),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to the detail screen for the selected volunteering opportunity
            },
          );
        },
      ),
    );
  }
}