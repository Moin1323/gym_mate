import 'package:gym_mate/models/exercise/instruction.dart';

class Exercise {
  String? id; // Unique ID for the exercise
  final String name;
  final String category;
  final String muscleGroup;
  final String equipment;
  final String animationUrl;
  final String difficulty;
  final List<Instruction> instructions;

  Exercise({
    required this.id,
    required this.name,
    required this.category,
    required this.muscleGroup,
    required this.equipment,
    required this.animationUrl,
    required this.difficulty,
    required this.instructions,
  });

  // Convert Exercise to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id, // Include ID in JSON serialization
      'name': name,
      'category': category,
      'muscleGroup': muscleGroup,
      'equipment': equipment,
      'animationUrl': animationUrl,
      'difficulty': difficulty,
      'instructions':
          instructions.map((instruction) => instruction.toJson()).toList(),
    };
  }

  // Create an Exercise from JSON
  factory Exercise.fromJson(Map<String, dynamic> json) {
    List<Instruction> instructions = (json['instructions'] as List)
        .map((instruction) => Instruction.fromJson(instruction))
        .toList();

    return Exercise(
      id: json['id'] ??
          '', // Ensure ID is captured from JSON, default to empty string if not provided
      name: json['name'],
      category: json['category'],
      muscleGroup: json['muscleGroup'],
      equipment: json['equipment'],
      animationUrl: json['animationUrl'],
      difficulty: json['difficulty'],
      instructions: instructions,
    );
  }
}
