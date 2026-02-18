/// AuthRepository describes authentication operations.
///
/// In training app we keep it minimal:
/// - login(email, password)
/// - logout()
/// - currentUser (nullable)
///
/// Production apps might include refresh tokens, MFA, SSO, etc.
abstract class AuthRepository {
  String? get currentUserEmail;

  /// Returns true if login succeeded.
  Future<bool> login({required String email, required String password});

  Future<void> logout();
}
