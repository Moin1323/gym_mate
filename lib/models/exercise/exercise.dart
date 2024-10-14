import 'package:gym_mate/models/exercise/instruction.dart';

class Exercise {
  final String name;
  final String category;
  final String muscleGroup;
  final String equipment;
  final String animationUrl;
  final String difficulty;
  final List<Instruction> instructions;

  Exercise({
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
}
