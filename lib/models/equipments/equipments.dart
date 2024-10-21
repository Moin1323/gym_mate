class Equipment {
  final String name;
  final String description;
  final String category;
  final String imageUrl;
  final List<String>? availableSizes; // New field to handle sizes

  Equipment({
    required this.name,
    required this.description,
    required this.category,
    required this.imageUrl,
    this.availableSizes, // Initialize this field optionally
  });
}
