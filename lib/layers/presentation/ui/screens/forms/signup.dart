import 'package:auth_project/layers/domain/entities/auth_entity.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../controllers/auth_controller.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  AuthController authController = GetIt.I.get<AuthController>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController password1Controller = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign-up'),
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 80, 16, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Cadastre-se',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Digite seu email',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    TextField(
                      controller: firstNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'First name',
                      ),
                    ),
                    const SizedBox(width: 12),
                    TextField(
                      controller: lastNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Last name',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TextField(
                  controller: password1Controller,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Digite sua senha',
                    suffixIcon: IconButton(
                        icon: Icon(_isObscure
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TextField(
                  controller: password2Controller,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Confirme sua senha',
                    suffixIcon: IconButton(
                        icon: Icon(_isObscure
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: ElevatedButton(
                  onPressed: () async {
                    AuthEntity authEntity = AuthEntity(
                      email: emailController.text.trim(),
                      password: password1Controller.text.trim(),
                      password2: password2Controller.text.trim(),
                    );
                    if (authEntity.passwordsEquals()) {
                      await authController.signUp(authEntity)
                          ? Navigator.of(context)
                              .pushNamed('/storeRegistration')
                          : null;
                    }
                  },
                  child: const Text('Próximo'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
