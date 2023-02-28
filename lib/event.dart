class Event {
  final int? id;
  final String name;
  final String description;
  final String location;
  final DateTime date;

  Event({
    this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'location': location,
      'date': date.toIso8601String(),
    };
  }
}