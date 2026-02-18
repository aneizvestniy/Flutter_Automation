import '../domain/auth_repository.dart';

/// In-memory auth implementation for training.
///
/// Why:
/// - deterministic
/// - offline
/// - easy for QA engineers to reason about
///
/// Credentials (training default):
/// - email: `qa@example.com`
/// - password: `Password123!`
class InMemoryAuthRepository implements AuthRepository {
  static const defaultEmail = 'qa@example.com';
  static const defaultPassword = 'Password123!';

  String? _currentUserEmail;

  @override
  String? get currentUserEmail => _currentUserEmail;

  @override
  Future<bool> login({required String email, required String password}) async {
    // Simulate a tiny delay to mimic network latency.
    await Future<void>.delayed(const Duration(milliseconds: 200));

    final ok = email.trim() == defaultEmail && password == defaultPassword;
    if (ok) {
      _currentUserEmail = defaultEmail;
    }
    return ok;
  }

  @override
  Future<void> logout() async {
    _currentUserEmail = null;
  }

  /// Debug-only helper.
  void reset() {
    _currentUserEmail = null;
  }
}
