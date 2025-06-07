import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../../../core/core.dart';
import '../../../widgets/widgets.dart';
import '../controllers/auth_controller.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final AuthController controller;

  @override
  void initState() {
    controller = injector.get<AuthController>();

    effect(() {
      final userModel = controller.userModel.get();
      if (userModel.hasValue) {
        context.to.donation();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400, maxHeight: 500),
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [BoxShadow(color: Colors.grey.withAlpha(40), blurRadius: 10)],
          ),
          child: Form(
            key: controller.formKey,
            child: Watch((context) {
              return ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  AppInput(label: 'Usuário', controller: controller.userNameController, enabled: !controller.isLoading),
                  const SizedBox(height: 6),
                  AppInput(
                    label: 'Senha',
                    controller: controller.passwordController,
                    isPassword: true,
                    obscureText: true,
                    enabled: !controller.isLoading,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: controller.signIn,
                      child: controller.isLoading ? const Center(child: CircularProgressIndicator()) : const Text('Entrar'),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
