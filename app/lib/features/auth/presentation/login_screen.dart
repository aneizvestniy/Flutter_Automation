import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routing/routes.dart';
import '../../../core/testing/keys.dart';
import '../../debug/presentation/debug_screen.dart';
import 'auth_controller.dart';

/// LoginScreen — the first screen in the training app.
///
/// Testability rules demonstrated here:
/// - All critical widgets have `ValueKey`s from `AppKeys`.
/// - After tapping Login, we show deterministic UI outcomes:
///   - navigate to Notes screen (success)
///   - show error text (failure)
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController(text: 'qa@example.com');
  final _passwordCtrl = TextEditingController(text: 'Password123!');

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AuthController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        actions: [
          // Debug button is visible only when enabled.
          if (DebugScreen.isEnabled)
            IconButton(
              tooltip: 'Debug',
              onPressed: () => Navigator.of(context).pushNamed(Routes.debug),
              icon: const Icon(Icons.bug_report),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              key: AppKeys.screenLoginEmail,
              controller: _emailCtrl,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 12),
            TextField(
              key: AppKeys.screenLoginPassword,
              controller: _passwordCtrl,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              key: AppKeys.screenLoginSubmit,
              onPressed: controller.isLoading
                  ? null
                  : () async {
                      final ok = await controller.login(
                        email: _emailCtrl.text,
                        password: _passwordCtrl.text,
                      );
                      if (!context.mounted) return;
                      if (ok) {
                        Navigator.of(context).pushReplacementNamed(Routes.notes);
                      }
                    },
              child: controller.isLoading
                  ? const SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Login'),
            ),
            const SizedBox(height: 12),
            if (controller.error != null)
              Text(
                controller.error!,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 16),
            const Text(
              'Training credentials:\n- qa@example.com\n- Password123!',
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
