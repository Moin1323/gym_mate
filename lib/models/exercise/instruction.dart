class Instruction {
  final String details;

  Instruction({required this.details});

  // Convert Instruction to JSON
  Map<String, dynamic> toJson() {
    return {
      'details': details,
    };
  }

  // Create an Instruction from JSON
  factory Instruction.fromJson(Map<String, dynamic> json) {
    return Instruction(
      details: json['details'] as String,
    );
  }
}
