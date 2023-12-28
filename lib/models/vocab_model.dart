class VocabModel {
  String? sId;
  String? word;
  String? mean;
  int? count;
  String? createdAt;
  String? updatedAt;
  int? iV;

  VocabModel(
      {this.sId,
      this.word,
      this.mean,
      this.count,
      this.createdAt,
      this.updatedAt,
      this.iV});

  VocabModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    word = json['word'];
    mean = json['mean'];
    count = json['count'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['word'] = this.word;
    data['mean'] = this.mean;
    data['count'] = this.count;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
