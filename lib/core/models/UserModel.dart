import 'dart:core';

class UserModel {
   int? userID;
   String? username;
   String? password;

  UserModel({
    this.userID,
     this.username,
     this.password,
  });

  factory UserModel.fromJson(json) {
    return UserModel(
      userID: json["userID"],
      username: json["username"],
      password: json["password"],
    );
  }

   Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
    };
  }
}
