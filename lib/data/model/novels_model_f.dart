import 'package:cloud_firestore/cloud_firestore.dart';

class NovelsModelFire {
  String? id;
  String? title;
  String? nickName;
  String? intro;
  String? story;
  String? audio;
  String? image;
  String? begin;
  String? end;
  String? BCE;
  String? child;
  String? kind;

  NovelsModelFire(
      {this.id,
      this.title,
      this.story,
      this.audio,
      this.nickName,
      this.kind,
      this.intro,
      this.image,
      this.end,
      this.child,
      this.begin,
      this.BCE});

  factory NovelsModelFire.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return NovelsModelFire(
        id: doc.id,
        title: data["title"] ?? "",
        nickName: data['nickname'] ?? '',
        story: data["story"] ?? '',
        audio: data["audio"] ?? "",
        image: data['image'] ?? '',
        intro: data['intro'] ?? '',
        begin: data['begin'] ?? '',
        end: data['end'] ?? '',
        BCE: data['BCE'] ?? '1',
        child: data['child'] ?? '1',
        kind: data['kind'] ?? '0');
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'nickname': nickName,
      'story': story,
      'audio': audio,
      'image': image,
      "intro": intro,
      'begin': begin,
      'end': end,
      'BCE': BCE,
      'child': child,
      'kind': kind,
    };
  }

  @override
  String toString() {
    return "Novel{id: $id , title: $title}";
  }
}



// import 'package:cloud_firestore/cloud_firestore.dart';

// class Post {
//   final String id;
//   final String title;

//   Post({
//     required this.id,
//     required this.title,
//   });

//   factory Post.fromFirestore(DocumentSnapshot doc) {
//     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//     return Post(
//       id: doc.id,
//       title: data['title'] ?? '',
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'title': title,
//     };
//   }

//   @override
//   String toString() {
//     return 'Post{id: $id, title: $title}';
//   }
// }
