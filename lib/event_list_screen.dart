import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';
import 'event.dart';
import 'volunteering_screen.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'add_event_screen.dart';

class EventListScreen extends StatefulWidget {
  @override
  _EventListScreenState createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  List<Event> _events = [];

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  void _loadEvents() async {
    List<Event> events = await DatabaseHelper.instance.getEvents();
    setState(() {
      _events = events;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event List'),
      ),
      body: ListView.builder(
        itemCount: _events.length,
        itemBuilder: (BuildContext context, int index) {
          final event = _events[index];
          return ListTile(
            title: Text(event.name),
            subtitle: Text(event.description),
            trailing: Text(DateFormat('MM/dd/yyyy').format(event.date)),
          );
        },
      ),
      floatingActionButton: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      FloatingActionButton(           
        heroTag: null,
        onPressed: () { 
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => AddEventScreen()),
          );
        },           
        child: const Icon(
          Icons.add
        )
        
      )
    ]
  )
    );
  }
}