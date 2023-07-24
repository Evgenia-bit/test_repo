import 'package:vk/domain/api_client/api_client.dart';
import 'package:vk/domain/data_providers/session_data_provider.dart';

class AuthService {
  final _apiClient = ApiClient();
  final _sessionDataProvider = SessionDataProvider();

  Future<bool> isAuth() async {
    await Future.delayed(const Duration(seconds: 1));
    String? sessionId = await _sessionDataProvider.getSessionId();
    final isAuth = sessionId != null;
    return isAuth;
  }

  Future<void> login(String login, bool saveLogin) async {
    final sessionId = await _apiClient.auth(login: login);
    if (saveLogin) await _sessionDataProvider.setSessionId(sessionId);
  }
}
