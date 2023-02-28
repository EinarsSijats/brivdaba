import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';
import 'event.dart';
import 'event_list_screen.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Event Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an event name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Event Description',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an event description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(
                  labelText: 'Event Location',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an event location';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('Event Date:'),
                  const SizedBox(width: 16),
                  TextButton(
                    onPressed: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: _selectedDate,
                        firstDate: DateTime(2021),
                        lastDate: DateTime(2100),
                      );
                      if (selectedDate != null) {
                        setState(() {
                          _selectedDate = selectedDate;
                        });
                      }
                    },
                    child: Text(DateFormat('MM/dd/yyyy').format(_selectedDate)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: const Text('Save Event'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final event = Event(
                      name: _nameController.text,
                      description: _descriptionController.text,
                      location: _locationController.text,
                      date: _selectedDate,
                    );
                    DatabaseHelper.instance.insertEvent(event);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => EventListScreen()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}