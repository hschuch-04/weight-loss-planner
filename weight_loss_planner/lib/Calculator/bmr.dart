/// The class which gets the users information and calculates their BMR
class BasalMetabolicRate {
  late int weight; // Weight of the user
  late int height; // Height of the user
  late int age; // Age of the user
  late double activitymulti; // The multiplier based on how much training
  late double bmr; // The default BMR Value

  BasalMetabolicRate(this.weight, this.height, this.age, this.activitymulti);

  /// Calculates male BMR value
  /// Uses Mifflin-St Jeor Equation
  List<Map> malecalories() {
    bmr = 10 * weight + 6.25 * height - 5 * age + 5;
    return [
      {'value': 'Maintain Weight', 'calories': '${bmr * activitymulti}'},
      {
        'value': 'Mild Weight Loss (0.25kg/week)',
        'calories': '${(bmr * activitymulti) - 250}'
      },
      {
        'value': 'Weight Loss (0.5kg/week)',
        'calories': '${(bmr * activitymulti) - 500}'
      },
      {
        'value': 'Extreme Weight Loss (1kg/week)',
        'calories': '${(bmr * activitymulti) - 1000}'
      }
    ];
  }

  /// Calculates female BMR value
  /// Mifflin-St Jeor Equation
  List<Map> femalecalories() {
    bmr = 10 * weight + 6.25 * height - 5 * age - 161;
    return [
      {'value': 'Maintain Weight', 'calories': '${bmr * activitymulti}'},
      {
        'value': 'Mild Weight Loss (0.25kg/week)',
        'calories': '${(bmr * activitymulti) - 250}'
      },
      {
        'value': 'Weight Loss (0.5kg/week)',
        'calories': '${(bmr * activitymulti) - 500}'
      },
      {
        'value': 'Extreme Weight Loss (1kg/week)',
        'calories': '${(bmr * activitymulti) - 1000}'
      }
    ];
  }
}

/// Class which holds list infomration for creating widgets
class ListInformation {

  /// Gets the multiplier for the BMR to evaluate activity
  static double activityValue(String activity) {
    switch (activity) {
      case 'Light':
        return 1.375;
      case 'Moderate':
        return 1.465;
      case 'Active':
        return 1.55;
      case 'Very Active':
        return 1.725;
      case 'Extra Active':
        return 1.9;
      default:
        return 1.2;
    }
  }

  /// The details for the Form Drop Down widget
  static List<Map<String, String>> formdropdown = [
    {'value': 'Sedentary: little or no exercise', 'key': 'Sedentary'},
    {'value': 'Light: exercise 1-3 times/week', 'key': 'Light'},
    {'value': 'Moderate: exercise 4-5 times/week', 'key': 'Moderate'},
    {
      'value': 'Active: daily exercise or intense exercise 3-4 times/week',
      'key': 'Active'
    },
    {'value': 'Very Active: intense exercise 6-7 times/week', 'key': 'Very Active'},
    {
      'value': 'Extra Active: very intense exercise daily, or physical job',
      'key': 'Extra Active'
    },
  ];
  
  /// List with text value details for widget loop creaton
  static List<String> formname = ['weight', 'height', 'age'];
  
  /// List for text title details for the widget loop
  static List<String> formtext = [
    'Enter your weight',
    'Enter your height (cm)',
    'Enter your age'
  ];

}
