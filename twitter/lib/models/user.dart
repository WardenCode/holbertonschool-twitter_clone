class User {
  late String key;
  late String userID;
  late String email;
  late String userName;
  late String displayName;
  late String imageUrl;
  late int followers;
  late int following;
  late List<String> followersList;
  late List<String> followingList;

  User({
    String key = '',
    String userID = '',
    String email = '',
    String userName = '',
    String displayName = '',
    String imageUrl =
        'https://freepngimg.com/thumb/google/66726-customer-account-google-service-button-search-logo.png',
    int followers = 0,
    int following = 0,
    List<dynamic> followersList = const [],
    List<dynamic> followingList = const [],
  });

  User.fromJson(Map<String, dynamic> map) {
    key = map["key"];
    userID = map["userID"];
    email = map["email"];
    userName = map["userName"];
    displayName = map["displayName"];
    imageUrl = map["imageUrl"];
    followers = map["followers"];
    following = map["following"];
    followersList = map["followersList"];
    followingList = map["followingList"];
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'userID': userID,
      'email': email,
      'userName': userName,
      'displayName': displayName,
      'imageUrl': imageUrl,
      'followers': followers,
      'following': following,
      'followersList': followersList,
      'followingList': followingList,
    };
  }
}
