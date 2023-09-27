/// The meals class which will contain all the necessary data such as
/// Calories, Protein, Fat, etc..
class Meal {
  final int id;
  final String name;
  final int calories;
  final int dayId;

  // Constructor
  const Meal({required this.id, 
              required this.name, 
              required this.calories,
              required this.dayId
            });
}
