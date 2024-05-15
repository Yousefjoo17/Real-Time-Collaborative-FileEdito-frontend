class UserFilePermission {
  int? id;
  int? userId;
  int? fileId;
  int? permisson;

  UserFilePermission({
    this.id,
    this.fileId,
    this.userId,
    this.permisson,
  });

  factory UserFilePermission.fromJson(json) {
    return UserFilePermission(
      id: json["id"],
      fileId: json["fileid"],
      userId: json["userid"],
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
