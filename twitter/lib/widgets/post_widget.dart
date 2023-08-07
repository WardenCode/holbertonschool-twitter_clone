import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(
          "https://cdn.pocket-lint.com/r/s/1200x/assets/images/153339-games-news-does-mario-sunbathing-pic-mean-mario-sunshine-for-switch-is-near-image1-9zsg71zrml.jpg",
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 11.5),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: const Text(
                "Mario",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: const Icon(
                Icons.verified_rounded,
                size: 18,
                color: Colors.lightBlue,
              ),
            ),
            Text(
              '@SuperMario',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
      subtitle: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 3, bottom: 10),
            child: const Text(
              "If you're a Nintendo Switch Online + Expansion Pack member, you can already download the Mario Kart 8 Deluxe - Booster Course Pass at no additional cost now and be ready to play at launch this friday!... 🎮🎮",
              softWrap: true,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.mode_comment_outlined,
                            size: 18,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        const Text('2'),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.repeat_rounded,
                            size: 18,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        const Text('2'),
                      ],
                    ),
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.favorite,
                            size: 18,
                            color: Colors.red,
                          ),
                        ),
                        Text("2"),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.share,
                size: 18,
                color: Colors.grey.shade400,
              ),
            ],
          ),
        ],
      ),
      trailing: const Icon(
        Icons.more_horiz_outlined,
        size: 20,
        color: Colors.black,
      ),
    );
  }
}
