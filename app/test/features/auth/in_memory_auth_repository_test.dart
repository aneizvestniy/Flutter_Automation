import 'package:flutter_test/flutter_test.dart';
import 'package:training_app/features/auth/data/in_memory_auth_repository.dart';

void main() {
  test('login succeeds with training credentials', () async {
    final repo = InMemoryAuthRepository();

    final ok = await repo.login(
      email: InMemoryAuthRepository.defaultEmail,
      password: InMemoryAuthRepository.defaultPassword,
    );

    expect(ok, isTrue);
    expect(repo.currentUserEmail, InMemoryAuthRepository.defaultEmail);
  });

  test('login fails with wrong credentials', () async {
    final repo = InMemoryAuthRepository();

    final ok = await repo.login(email: 'wrong@example.com', password: 'nope');

    expect(ok, isFalse);
    expect(repo.currentUserEmail, isNull);
  });

  test('logout clears current user', () async {
    final repo = InMemoryAuthRepository();

    await repo.login(
      email: InMemoryAuthRepository.defaultEmail,
      password: InMemoryAuthRepository.defaultPassword,
    );

    await repo.logout();

    expect(repo.currentUserEmail, isNull);
  });
}
