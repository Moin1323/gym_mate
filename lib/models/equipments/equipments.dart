class Equipment {
  final String name;
  final String description;
  final String category;
  final String imageUrl;
  final List<String>? availableSizes;

  Equipment({
    required this.name,
    required this.description,
    required this.category,
    required this.imageUrl,
    this.availableSizes,
  });

  // From JSON
  factory Equipment.fromJson(Map<String, dynamic> json) {
    return Equipment(
      name: json['name'],
      description: json['description'],
      category: json['category'],
      imageUrl: json['imageUrl'],
      availableSizes: json['availableSizes'] != null
          ? List<String>.from(json['availableSizes'])
          : null, // Handle null values for availableSizes
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'category': category,
      'imageUrl': imageUrl,
      'availableSizes':
          availableSizes, // Can be null, so no need to handle explicitly
    };
  }
}
