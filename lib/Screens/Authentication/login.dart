import 'package:flutter/material.dart';
import 'package:rest_api_notepad/Styles/colors.dart';
import 'package:rest_api_notepad/Utils/custom_textfield.dart';
import 'package:rest_api_notepad/Utils/router.dart';

import '../../Utils/button.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _password.clear();
    _email.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(color: white),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  customTextField(
                      hint: 'Enter your valid email',
                      title: 'Email',
                      controller: _email),
                  customTextField(
                      hint: 'Enter your valid password',
                      title: 'Password',
                      controller: _password),

                  ///Button
                  customButton(
                    text: "Login",
                    context: context,
                    tap: () {},
                    status: false,
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      PageNavigator(ctx: context).nextPageOnly(
                        page: const RegisterPage(),
                      );
                    },
                    child: const Text('Register Instead'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
