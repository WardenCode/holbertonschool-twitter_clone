import 'package:flutter/material.dart';
import 'package:twitter/providers/auth_state.dart';
import 'package:twitter/screens/forgot_password_screen.dart';
import 'package:twitter/screens/signin_screen.dart';
import 'package:twitter/widgets/bar_menu.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmController;
  final _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 247, 246, 246),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Sign Up",
          style: TextStyle(color: Colors.black),
        ),
      ),
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
                    "Sign Up",
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
              height: 340,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomEntryField(
                      hint: "Enter name",
                      controller: _nameController,
                    ),
                    CustomEntryField(
                      hint: "Enter email",
                      controller: _emailController,
                    ),
                    CustomEntryField(
                      hint: "Enter password",
                      controller: _passwordController,
                      isPassword: true,
                    ),
                    CustomEntryField(
                      hint: "Enter password",
                      controller: _confirmController,
                      isPassword: true,
                    ),
                  ],
                ),
              ),
            ),
            CustomFlatButton(
              label: "Submit",
              fontWeight: FontWeight.bold,
              onPressed: () async {
                signUpUser();
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomFlatButton(
                    label: "Sign In",
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignIn(),
                        ),
                      );
                    },
                  ),
                  CustomFlatButton(
                    label: "Forget Password?",
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

  void signUpUser() async {
    final ifSignUp = await Auth().attemptSignUp(
        _emailController.text.trim(),
        _nameController.text.trim(),
        _passwordController.text.trim(),
        _confirmController.text.trim()
    );

    String errorMsg = '';
    switch (ifSignUp) {
      case Errors.none:
        errorMsg = 'Account Created!';
        break;
      case Errors.weakError:
        errorMsg = 'The password provided is too weak.';
        break;
      case Errors.matchError:
        errorMsg = 'Passwords doesn’t match.';
        break;
      case Errors.existsError:
        errorMsg = 'An account already exists with that email.';
        break;
      case Errors.error:
        errorMsg = 'Failed to Login! Please try later.';
        break;
      default:
        errorMsg = 'Unknown error';
    }

    final snackBar = SnackBar(
      duration: const Duration(seconds: 1),
      content: Text(errorMsg),
      backgroundColor: ifSignUp == Errors.none ? Colors.green : Colors.red,
      action: SnackBarAction(
        label: '',
        onPressed: () {
        },
      ),
    );

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
