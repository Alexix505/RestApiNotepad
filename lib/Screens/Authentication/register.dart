import 'package:flutter/material.dart';
import 'package:rest_api_notepad/Screens/Authentication/login.dart';
import 'package:rest_api_notepad/Styles/colors.dart';
import 'package:rest_api_notepad/Utils/custom_textfield.dart';
import 'package:rest_api_notepad/Utils/router.dart';

import '../../Utils/button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();

  @override
  void dispose() {
    _password.clear();
    _email.clear();
    _firstName.clear();
    _lastName.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
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
                      hint: 'Enter your first name',
                      title: 'Email',
                      controller: _firstName),
                  customTextField(
                      hint: 'Enter your last name',
                      title: 'Email',
                      controller: _lastName),
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
                    text: "Register",
                    context: context,
                    tap: () {},
                    status: false,
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      PageNavigator(ctx: context).nextPage(
                        page: const LoginPage(),
                      );
                    },
                    child: const Text('Login Instead'),
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
