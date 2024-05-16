class UpdatedFileModel {
  String? added;
  int? pos;
  String? content;

  UpdatedFileModel({this.added, this.pos, this.content});

  Map<String, dynamic> toJson() {
    return {
      "added": added,
      "pos": pos,
      "content": content,
    };
  }

  factory UpdatedFileModel.fromJson(json) {
    return UpdatedFileModel(
      added: json["added"],
      pos: json["pos"],
      content: json["content"],
    );
  }
}
