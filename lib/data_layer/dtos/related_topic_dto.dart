import 'icon_dto.dart';

class RelatedTopicDTO {
  final String? firstUrl;
  final IconDTO? icon;
  final String? result;
  final String? text;

  RelatedTopicDTO({
    this.firstUrl,
    this.icon,
    this.result,
    this.text,
  });

  RelatedTopicDTO copyWith({
    String? firstUrl,
    IconDTO? icon,
    String? result,
    String? text,
  }) =>
      RelatedTopicDTO(
        firstUrl: firstUrl ?? this.firstUrl,
        icon: icon ?? this.icon,
        result: result ?? this.result,
        text: text ?? this.text,
      );

  factory RelatedTopicDTO.fromMap(Map<String, dynamic> map) {
    return RelatedTopicDTO(
      firstUrl: map['FirstURL'],
      icon: IconDTO.fromMap(map['Icon']),
      result: map['Result'],
      text: map['Text'],
    );
  }
}
