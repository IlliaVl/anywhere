import '../../domain_layer/models/character.dart';
import '../dtos/related_topic_dto.dart';

/// Extension that provides mappings for [RelatedTopicDTO]
extension RelatedTopicDTOMapping on RelatedTopicDTO {
  /// Maps into a [Character]
  Character toCharacter() => Character(
        name: text?.split(' - ').first,
        description: text?.split(' - ').last,
        icon: icon?.url,
      );
}
