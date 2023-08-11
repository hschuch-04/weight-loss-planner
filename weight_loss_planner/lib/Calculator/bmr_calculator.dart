/// FOR MEN: BMR = 13.397W + 4.799H - 5.677A + 88.362
/// FOR WOMEN: BMR = 9.247W + 3.098H - 4.330A + 447.593
///
/// Sedentary (little or no exercise) = BMR x 1.2
/// Lightly active (light exercise or sports 1-3 days a week) = BMR x 1.375
/// Moderately active (moderate exercise or sports 3-5 days a week) = BMR x 1.55
/// Very active (hard exercise or sports 6-7 days a week) = BMR x 1.725
/// Extra active (very hard exercise or sports, physical job or training twice a day) = BMR x 1.9
///

/// The class which gets the users information and calculates their BMR
class BasalMetabolicRate {
  late double weight;
  late int height;
  late int age;

  BasalMetabolicRate(this.weight, this.height, this.age);

  // Calculates male BMR value
  double malebmr() {
    return 13.397 * weight + 4.799 * height - 5.677 * age + 88.362;
  }

  // Calculates female BMR value
  double femalebmr() {
    return 9.247 * weight + 3.098 * height - 4.33 * age + 447.593;
  }
}

/// Class which holds list infomration for creating widgets
class ListInformation {
  static List<Map<String, String>> formdropdown = [
    { 'value': 'Sedentary: little or no exercise', 'key': 'Sedentary'},
    { 'value': 'Light: exercise 1-3 times/week', 'key': 'Light'},
    { 'value': 'Moderate: exercise 4-5 times/week', 'key': 'Moderate'},
    { 'value': 'Active: daily exercise or intense exercise 3-4 times/week', 'key': 'Active'},
    { 'value': 'Very Active: intense exercise 6-7 times/week', 'key': 'Very'},
    { 'value': 'Extra Active: very intense exercise daily, or physical job', 'key': 'Extra'},
  ];
  static List<String> formname = ['weight', 'height', 'age'];
  static List<String> formtext = [
    'Enter your weight',
    'Enter your height (cm)',
    'Enter your age'
  ];
}
