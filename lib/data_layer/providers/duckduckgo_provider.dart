import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain_layer/models/characters_error.dart';
import '../dtos/related_topic_dto.dart';

/// Provides data related to duckduckgo API.
class DuckduckgoProvider {
  static const _baseUrl = 'api.duckduckgo.com';

  final http.Client _httpClient;

  final String _baseQuery;

  /// Creates new [DuckduckgoProvider].
  DuckduckgoProvider({
    http.Client? httpClient,
    required String baseQuery,
  })  : _httpClient = httpClient ?? http.Client(),
        _baseQuery = baseQuery;

  Uri _getUrl(
    String path, {
    Map<String, dynamic>? parameters,
  }) =>
      Uri.https(
        _baseUrl,
        path,
        {
          ...?parameters,
        },
      );

  /// Returns list of [RelatedTopicDTO]
  Future<List<RelatedTopicDTO>> getRelatedTopics() async {
    final url =
        Uri.parse('http://api.duckduckgo.com/?q=$_baseQuery&format=json');

    final response = await _httpClient.get(url);
    if (response.statusCode != 200) {
      throw const CharactersException(
        CharacterExceptionType.network,
      );
    }
    try {
      final bodyJson = jsonDecode(response.body) as Map<String, dynamic>;
      final relatedTopics = (bodyJson['RelatedTopics'] as List<dynamic>)
          .map(
            (relatedTopic) => RelatedTopicDTO.fromMap(
              relatedTopic,
            ),
          )
          .toList();
      return relatedTopics;
    } catch (_) {
      throw const CharactersException(
        CharacterExceptionType.parsing,
      );
    }
  }
}
