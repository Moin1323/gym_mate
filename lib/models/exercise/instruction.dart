class Instruction {
  final String details;

  Instruction({required this.details});

  // Convert Instruction to JSON
  Map<String, dynamic> toJson() {
    return {
      'details': details,
    };
  }
}
