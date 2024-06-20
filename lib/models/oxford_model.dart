class OxfordModel {
  String? sId;
  String? word;
  String? mean;
  bool? remember;
  String? createdAt;
  String? updatedAt;
  int? iV;

  OxfordModel(
      {this.sId,
      this.word,
      this.mean,
      this.remember,
      this.createdAt,
      this.updatedAt,
      this.iV});

  OxfordModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    word = json['word'];
    mean = json['mean'];
    remember = json['remember'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['word'] = this.word;
    data['mean'] = this.mean;
    data['remember'] = this.remember;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
