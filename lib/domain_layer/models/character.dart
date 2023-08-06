class Character {
  final String? name;
  final String? description;
  final String? icon;

  Character({
    this.name,
    this.description,
    this.icon,
  });

  Character copyWith({
    String? name,
    String? description,
    String? icon,
  }) =>
      Character(
        name: name ?? this.name,
        description: description ?? this.description,
        icon: icon ?? this.icon,
      );
}
