class FileModel {
  int? fileID;
  String? content;

  FileModel({
    this.content,
    this.fileID,
  });

  factory FileModel.fromJson(json) {
    return FileModel(
      content: json["content"],
      fileID: json["fileID"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "content": content,
      "fileID": fileID,
    };
  }
}
