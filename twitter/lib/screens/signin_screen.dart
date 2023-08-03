import 'package:flutter/material.dart';
import 'package:twitter/screens/forgot_password_screen.dart';
import 'package:twitter/screens/home_screen.dart';
import 'package:twitter/screens/signup_screen.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 247, 246, 246),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 135,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image(
                    height: 90,
                    width: 90,
                    image: NetworkImage(
                      "http://assets.stickpng.com/images/580b57fcd9996e24bc43c53e.png",
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 163,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomEntryField(
                    hint: "Enter email",
                    controller: _emailController,
                  ),
                  CustomEntryField(
                    hint: "Enter password",
                    controller: _passwordController,
                    isPassword: true,
                  ),
                ],
              ),
            ),
            CustomFlatButton(
              label: "Submit",
              fontWeight: FontWeight.bold,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomFlatButton(
                    label: "Sign Up",
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ),
                      );
                    },
                  ),
                  CustomFlatButton(
                    label: "Forget Pasword?",
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgetPassword(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
