/// success : true
/// results : [{"video":{"url":"https://res.cloudinary.com/dc4zgmrmf/video/upload/v1715812201/VoiceVerse/videos/66452cf0d5cfee05bc27ad0e/oo5ahb8qifjar5md50wm.mp4","id":"VoiceVerse/videos/66452cf0d5cfee05bc27ad0e/oo5ahb8qifjar5md50wm"},"_id":"66453769588a0a3cea948f0c","title":"نمنم","description":"نمنم المجنون ابو قلب حنون","user":"66452cf0d5cfee05bc27ad0e","createdAt":"2024-05-15T22:30:01.946Z","updatedAt":"2024-05-15T22:30:01.946Z","__v":0}]

class UploadedVideosModel {
  UploadedVideosModel({
      bool? success, 
      List<Results>? results,}){
    _success = success;
    _results = results;
}

  UploadedVideosModel.fromJson(dynamic json) {
    _success = json['success'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Results.fromJson(v));
      });
    }
  }
  bool? _success;
  List<Results>? _results;

  bool? get success => _success;
  List<Results>? get results => _results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// video : {"url":"https://res.cloudinary.com/dc4zgmrmf/video/upload/v1715812201/VoiceVerse/videos/66452cf0d5cfee05bc27ad0e/oo5ahb8qifjar5md50wm.mp4","id":"VoiceVerse/videos/66452cf0d5cfee05bc27ad0e/oo5ahb8qifjar5md50wm"}
/// _id : "66453769588a0a3cea948f0c"
/// title : "نمنم"
/// description : "نمنم المجنون ابو قلب حنون"
/// user : "66452cf0d5cfee05bc27ad0e"
/// createdAt : "2024-05-15T22:30:01.946Z"
/// updatedAt : "2024-05-15T22:30:01.946Z"
/// __v : 0

class Results {
  Results({
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

  Results.fromJson(dynamic json) {
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

/// url : "https://res.cloudinary.com/dc4zgmrmf/video/upload/v1715812201/VoiceVerse/videos/66452cf0d5cfee05bc27ad0e/oo5ahb8qifjar5md50wm.mp4"
/// id : "VoiceVerse/videos/66452cf0d5cfee05bc27ad0e/oo5ahb8qifjar5md50wm"

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