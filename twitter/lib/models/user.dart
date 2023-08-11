import 'package:uuid/uuid.dart';

const uuid = Uuid();

class User {
  late String key;
  late String userID;
  late String email;
  late String userName;
  late String displayName;
  late String imageUrl;
  late int followers;
  late int following;
  late List<dynamic> followersList;
  late List<dynamic> followingList;

  User({
    key = '',
    this.userID = '',
    this.email = '',
    this.userName = '',
    this.displayName = '',
    this.imageUrl =
        'https://freepngimg.com/thumb/google/66726-customer-account-google-service-button-search-logo.png',
    this.followers = 0,
    this.following = 0,
    this.followersList = const [],
    this.followingList = const [],
  }) {
    this.key = uuid.v4();
  }

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
