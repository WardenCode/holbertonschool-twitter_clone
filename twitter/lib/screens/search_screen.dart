import 'package:flutter/material.dart';
import 'package:twitter/widgets/users_search_results_widget.dart';
import 'package:twitter/assets/data_dummy.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _searchconttroller = TextEditingController();

  @override
  void initState() {
    _searchconttroller = _searchconttroller;
    super.initState();
  }

  @override
  void dispose() {
    _searchconttroller = _searchconttroller;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            return UserSearchResultsWidget(
              name: userList[index]["name"],
              imgUrl: userList[index]["imgUrl"],
              username: userList[index]["username"],
              bio: userList[index]["bio"],
              isVerified: userList[index]["isVerified"],
            );
          },
        ),
      ),
    );
  }
}
