class Character {
  final String? name;
  final String? description;
  final String? imageUrl;

  Character({
    this.name,
    this.description,
    this.imageUrl,
  });

  Character copyWith({
    String? name,
    String? description,
    String? imageUrl,
  }) =>
      Character(
        name: name ?? this.name,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
      );
}
