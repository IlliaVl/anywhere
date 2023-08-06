import 'package:http/http.dart' as http;

/// Handles all communication with the backend
class NetClient {
  final http.Client _httpClient;

  NetClient(this._httpClient);
}
