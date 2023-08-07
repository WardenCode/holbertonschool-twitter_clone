import 'package:flutter/material.dart';

class UserSearchResultsWidget extends StatelessWidget {
  final String name;
  final String username;
  final String bio;
  final String imgUrl;
  final bool isVerified;

  const UserSearchResultsWidget({
    required this.name,
    required this.username,
    required this.bio,
    required this.imgUrl,
    required this.isVerified,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 570),
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(imgUrl),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    bio,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  "@$username",
                  style: TextStyle(
                    color: Colors.grey[500]!,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          isVerified
              ? Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.verified,
                    color: Colors.blue[300]!,
                  ))
              : const Column(),
        ],
      ),
    );
  }
}
