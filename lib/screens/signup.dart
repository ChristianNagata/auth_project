import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../authentication_service.dart';
import '../main.dart';

class SignUp extends StatefulWidget {

  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();

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
                      context
                          .read<AuthenticationService>()
                          .signUp(
                            email: emailController.text.trim(),
                            password1: password1Controller.text.trim(),
                            password2: password2Controller.text.trim(),
                          )
                          .then(
                            (response) => {
                              if (response == 'Successful')
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AuthenticationWrapper(),
                                    ),
                                  ),
                                }
                            },
                          );
                    },
                    child: const Text('Cadastrar'),
                    style: Theme.of(context).elevatedButtonTheme.style),
              )
            ],
          ),
        ),
      ),
    );
  }
}
