class Equipment {
  final String id; // New unique ID field
  final String name;
  final String description;
  final String category;
  final String imageUrl;
  final List<String>? availableSizes;

  Equipment({
    required this.id, // Initialize the ID field
    required this.name,
    required this.description,
    required this.category,
    required this.imageUrl,
    this.availableSizes,
  });

  // From JSON
  factory Equipment.fromJson(Map<String, dynamic> json) {
    return Equipment(
      id: json['id'], // Include ID when parsing
      name: json['name'],
      description: json['description'],
      category: json['category'],
      imageUrl: json['imageUrl'],
      availableSizes: json['availableSizes'] != null
          ? List<String>.from(json['availableSizes'])
          : null,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id, // Include ID in JSON
      'name': name,
      'description': description,
      'category': category,
      'imageUrl': imageUrl,
      'availableSizes': availableSizes,
    };
  }
}
