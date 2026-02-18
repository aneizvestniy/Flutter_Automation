import 'package:flutter/foundation.dart';

import '../domain/auth_repository.dart';

/// AuthController is a small state holder for the Login flow.
///
/// QA perspective:
/// - this is where we keep the state that drives the UI
/// - tests can assert on controller state OR on UI state derived from it
class AuthController extends ChangeNotifier {
  AuthController(this._repo);

  final AuthRepository _repo;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  String? get currentUserEmail => _repo.currentUserEmail;

  Future<bool> login({required String email, required String password}) async {
    _error = null;
    _isLoading = true;
    notifyListeners();

    final ok = await _repo.login(email: email, password: password);

    _isLoading = false;
    if (!ok) {
      _error = 'Invalid credentials';
    }
    notifyListeners();
    return ok;
  }

  Future<void> logout() async {
    await _repo.logout();
    notifyListeners();
  }
}
