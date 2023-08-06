class IconDTO {
  final String? height;
  final String? url;
  final String? width;

  IconDTO({
    this.height,
    this.url,
    this.width,
  });

  IconDTO copyWith({
    String? height,
    String? url,
    String? width,
  }) =>
      IconDTO(
        height: height ?? this.height,
        url: url ?? this.url,
        width: width ?? this.width,
      );

  factory IconDTO.fromMap(Map<String, dynamic> map) {
    return IconDTO(
      height: map['Height'],
      url: map['URL'],
      width: map['Width'],
    );
  }
}
