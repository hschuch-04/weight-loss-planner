/// The weight measured on that day to then be shown graphically over time
class Weight {
  final int id;
  final double weight;
  final DateTime date;

  // Constructor
  const Weight(
      {required this.id,
      required this.weight,
      required this.date});

  /// Converts the database result into a map
  Map<String, dynamic> toMap() {
    return {'id': id, 'weight': weight, 'date': date};
  }

  /// Prints out the results in an easy to read format
  @override
  String toString() {
    return 'Meal{id: $id, weight: $weight, date: $date}';
  }
}
