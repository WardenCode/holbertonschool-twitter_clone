import 'package:flutter/material.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
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
          "Forget Password",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: Column(
          children: [
            const Text(
              "Forget Password",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 310,
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: const Text(
                "Enter your email address below to receive password reset instructions.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF9b9b9b), fontSize: 18),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: CustomEntryField(
                hint: "Enter Email",
                controller: _emailController,
              ),
            ),
            CustomFlatButton(
              label: "Submit",
              onPressed: () {},
              fontWeight: FontWeight.bold,
            )
          ],
        ),
      ),
    );
  }
}
