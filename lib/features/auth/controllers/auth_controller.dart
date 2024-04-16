import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iiitrnexus1/features/auth/repsitory/auth_repository.dart';
import 'package:iiitrnexus1/core/utils.dart';
import 'package:iiitrnexus1/models/user_modle.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);

final authControllerProvider = Provider(
  (ref) => AuthController(
      authRepository: ref.read(authRepositoryProvider), ref: ref),
);

class AuthController {
  final AuthRepository _authRepository;
  final Ref _ref;
  AuthController({required Ref ref, required AuthRepository authRepository})
      : _authRepository = authRepository,
        _ref = ref;

  void signInWithGoogle(BuildContext context) async {
    final user = await _authRepository.signInWithGoogle();
    user.fold(
        (l) => showSnackBar(context, l.message),
        (userModel) =>
            _ref.read(userProvider.notifier).update((state) => userModel));
  }
}
