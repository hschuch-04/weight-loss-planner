/// The meals class which will contain all the necessary data such as
/// Calories, Protein, Fat, etc..
class Meal {
  final int id;
  final String name;
  final int calories;
  final String days;

  // Constructor
  const Meal(
      {required this.id,
      required this.name,
      required this.calories,
      required this.days});

  /// Converts the database result into a map
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'calories': calories, 'days': days};
  }

  /// Prints out the results in an easy to read format
  @override
  String toString() {
    return 'Meal{id: $id, name: $name, calories: $calories, days: $days}';
  }
}
