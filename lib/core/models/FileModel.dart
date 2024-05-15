class FileModel {
  int? fileID;
  String? content;
  String? fileName;

  FileModel({
    this.content,
    this.fileID,
    this.fileName,
  });

  factory FileModel.fromJson(json) {
    return FileModel(
      content: json["content"],
      fileID: json["fileID"],
      fileName: json["fileName"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "content": content,
      "fileID": fileID,
      "fileName": fileName,
    };
  }
}
