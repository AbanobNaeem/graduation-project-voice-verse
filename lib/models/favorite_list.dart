
class FavoriteList {
  FavoriteList({
    bool? success,
    Results? results,}){
    _success = success;
    _results = results;
  }

  FavoriteList.fromJson(dynamic json) {
    _success = json['success'];
    _results = json['results'] != null ? Results.fromJson(json['results']) : null;
  }
  bool? _success;
  Results? _results;

  bool? get success => _success;
  Results? get results => _results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_results != null) {
      map['results'] = _results?.toJson();
    }
    return map;
  }

}

class Results {
  Results({
    String? id,
    String? user,
    List<Videos>? videos,
    num? v,}){
    _id = id;
    _user = user;
    _videos = videos;
    _v = v;
  }

  Results.fromJson(dynamic json) {
    _id = json['_id'];
    _user = json['user'];
    if (json['videos'] != null) {
      _videos = [];
      json['videos'].forEach((v) {
        _videos?.add(Videos.fromJson(v));
      });
    }
    _v = json['__v'];
  }
  String? _id;
  String? _user;
  List<Videos>? _videos;
  num? _v;

  String? get id => _id;
  String? get user => _user;
  List<Videos>? get videos => _videos;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['user'] = _user;
    if (_videos != null) {
      map['videos'] = _videos?.map((v) => v.toJson()).toList();
    }
    map['__v'] = _v;
    return map;
  }

}

/// id : {"video":{"url":"https://res.cloudinary.com/dc4zgmrmf/video/upload/v1714773920/VoiceVerse/videos/6633b1bdd1f752c1fe0b3360/xh3nbpmj0gqmbxuo1t80.mp4","id":"VoiceVerse/videos/6633b1bdd1f752c1fe0b3360/xh3nbpmj0gqmbxuo1t80"},"_id":"66355fa1ace8a52d27d66f9b","title":"idiot ","description":"30 second test","user":"6633b1bdd1f752c1fe0b3360","createdAt":"2024-05-03T22:05:21.134Z","updatedAt":"2024-05-03T22:05:21.134Z","__v":0}
/// _id : "66428960254cb7c89112dde4"

class Videos {
  Videos({
    this.id,
  });

  Id? id;

  Videos.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? Id.fromJson(json['id']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (id != null) {
      data['id'] = id!.toJson();
    }
    return data;
  }
}



class Id {
  Id({
    Video? video,
    String? id,
    String? title,
    String? description,
    String? user,
    String? createdAt,
    String? updatedAt,
    num? v,}){
    _video = video;
    _id = id;
    _title = title;
    _description = description;
    _user = user;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  Id.fromJson(dynamic json) {
    _video = json['video'] != null ? Video.fromJson(json['video']) : null;
    _id = json['_id'];
    _title = json['title'];
    _description = json['description'];
    _user = json['user'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  Video? _video;
  String? _id;
  String? _title;
  String? _description;
  String? _user;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  Video? get video => _video;
  String? get id => _id;
  String? get title => _title;
  String? get description => _description;
  String? get user => _user;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_video != null) {
      map['video'] = _video?.toJson();
    }
    map['_id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['user'] = _user;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}

/// url : "https://res.cloudinary.com/dc4zgmrmf/video/upload/v1714773920/VoiceVerse/videos/6633b1bdd1f752c1fe0b3360/xh3nbpmj0gqmbxuo1t80.mp4"
/// id : "VoiceVerse/videos/6633b1bdd1f752c1fe0b3360/xh3nbpmj0gqmbxuo1t80"

class Video {
  Video({
    String? url,
    String? id,}){
    _url = url;
    _id = id;
  }

  Video.fromJson(dynamic json) {
    _url = json['url'];
    _id = json['id'];
  }
  String? _url;
  String? _id;

  String? get url => _url;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['id'] = _id;
    return map;
  }

}