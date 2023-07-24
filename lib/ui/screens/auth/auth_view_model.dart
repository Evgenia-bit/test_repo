import 'package:flutter/cupertino.dart';
import 'package:vk/domain/services/auth_service.dart';
import 'package:vk/ui/navigation/main_navigation.dart';

enum AuthButtonState {
  canSubmit,
  authProcess,
  disable;
}

class _AuthViewModelState {
  bool saveLogin = true;
  String login = '';
  String? errorMessage;
  bool isAuthInProcess = false;

  AuthButtonState get authButtonState {
    if (isAuthInProcess) {
      return AuthButtonState.authProcess;
    } else if (login.isNotEmpty) {
      return AuthButtonState.canSubmit;
    } else {
      return AuthButtonState.disable;
    }
  }
}

class AuthViewModel extends ChangeNotifier {
  final _authService = AuthService();
  final state = _AuthViewModelState();

  void changeLogin(String value) {
    if (state.login == value) return;

    state.login = value;
    notifyListeners();
  }

  void changeSaveLogin(bool? value) {
    if (state.saveLogin == value || value == null) return;

    state.saveLogin = value;
    notifyListeners();
  }

  Future<void> auth(BuildContext context) async {
    final login = state.login;
    if (!_isValid(login)) {
      _updateState('Заполните логин и пароль', false);
      return;
    }

    _updateState(null, true);

    final errorMessage = await _login(login);
    if (errorMessage == null) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        MainNavigationRouteNames.mainScreen,
        (route) => false,
      );
    } else {
      _updateState(errorMessage, false);
    }
  }

  bool _isValid(String login) => login.isNotEmpty;

  Future<String?> _login(String login) async {
    try {
      await _authService.login(login, state.saveLogin);
    } catch (e) {
      return 'error';
    }
    return null;
  }

  void _updateState(String? errorMessage, bool isAuthProgress) {
    if (state.errorMessage == errorMessage &&
        state.isAuthInProcess == isAuthProgress) {
      return;
    }
    state.errorMessage = errorMessage;
    state.isAuthInProcess = isAuthProgress;
    notifyListeners();
  }
}
