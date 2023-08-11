import 'package:flutter/material.dart';
import 'package:twitter/providers/auth_state.dart';
import 'package:twitter/screens/signin_screen.dart';
import 'package:twitter/widgets/post_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var auth;

  @override
  void initState() {
    super.initState();
    getAsync();
  }

  Future<void> getAsync() async {
    try {
      auth = await Auth().getCurrentUserModel();
    } catch (e) {
      print(e);
    }
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const SingleChildScrollView(
            child: Column(
              children: [
                PostWidget(),
                PostWidget(),
                PostWidget(),
                PostWidget(),
                PostWidget(),
                PostWidget(),
              ],
            ),
          );
        } else {
          return const SignIn();
        }
      },
    );
  }
}
