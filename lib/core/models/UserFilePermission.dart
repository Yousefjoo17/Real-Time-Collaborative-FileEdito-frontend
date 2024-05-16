class UserFilePermission {
  int? id;
  int? userId;
  int? fileId;
  int? permisson;

  UserFilePermission({
    this.id,
    this.fileId,
    this.userId,
    this.permisson, //0 owner 1 Editor 2 viewer
  });

  factory UserFilePermission.fromJson(json) {
    return UserFilePermission(
      id: json["id"],
      fileId: json["fileId"],
      userId: json["userId"],
      permisson: json["permission"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "fileId": fileId,
      "userId": userId,
      "permission": permisson,
    };
  }
}
