class NovelsModel {
  int? novelsId;
  String? novelsName;
  String? novelsNickName;
  String? novelsIntro;
  String? novelsStory;
  String? novelsImage;
  int? novelsBegin;
  int? novelsEnd;
  int? novelsBCE;
  int? novelsChild;
  int? novelsKind;

  NovelsModel(
      {this.novelsId,
      this.novelsName,
      this.novelsNickName,
      this.novelsIntro,
      this.novelsStory,
      this.novelsImage,
      this.novelsBegin,
      this.novelsEnd,
      this.novelsBCE,
      this.novelsChild,
      this.novelsKind});

  NovelsModel.fromJson(Map<String, dynamic> json) {
    novelsId = json['novels_id'];
    novelsName = json['novels_name'];
    novelsNickName = json['novels_nickname'];
    novelsIntro = json['novels_intro'];
    novelsStory = json['novels_story'];
    novelsImage = json['novels_image'];
    novelsBegin = json['novels_begin'];
    novelsEnd = json['novels_end'];
    novelsBCE = json['novels_BCE'];
    novelsChild = json['novels_child'];
    novelsKind = json['novels_kind'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['novels_id'] = this.novelsId;
    data['novels_name'] = this.novelsName;
    data['novels_story'] = this.novelsStory;
    data['novels_image'] = this.novelsImage;
    data['novels_begin'] = this.novelsBegin;
    data['novels_end'] = this.novelsEnd;
    return data;
  }
}
