/// success : true
/// results : [{"video":{"url":"https://res.cloudinary.com/dc4zgmrmf/video/upload/v1714773695/VoiceVerse/videos/6633b1bdd1f752c1fe0b3360/bdjcmwe0dsvrormrfop0.mp4","id":"VoiceVerse/videos/6633b1bdd1f752c1fe0b3360/bdjcmwe0dsvrormrfop0"},"_id":"66355ec0023833b06ae7bcdd","title":"boo farhet el mared","user":{"profileImage":{"url":"https://res.cloudinary.com/dc4zgmrmf/image/upload/v1710460050/VoiceVerse%20defaults/user/WhatsApp_Image_2024-03-11_at_19.05.02_iowoqo.jpg","id":"VoiceVerse%20defaults/user/userDefaultProfile"},"_id":"6633b1bdd1f752c1fe0b3360","userName":"fatmaamr"},"createdAt":"2024-05-03T22:01:36.906Z","updatedAt":"2024-05-03T22:01:36.906Z","__v":0},{"video":{"url":"https://res.cloudinary.com/dc4zgmrmf/video/upload/v1714773920/VoiceVerse/videos/6633b1bdd1f752c1fe0b3360/xh3nbpmj0gqmbxuo1t80.mp4","id":"VoiceVerse/videos/6633b1bdd1f752c1fe0b3360/xh3nbpmj0gqmbxuo1t80"},"_id":"66355fa1ace8a52d27d66f9b","title":"idiot ","description":"30 second test","user":{"profileImage":{"url":"https://res.cloudinary.com/dc4zgmrmf/image/upload/v1710460050/VoiceVerse%20defaults/user/WhatsApp_Image_2024-03-11_at_19.05.02_iowoqo.jpg","id":"VoiceVerse%20defaults/user/userDefaultProfile"},"_id":"6633b1bdd1f752c1fe0b3360","userName":"fatmaamr"},"createdAt":"2024-05-03T22:05:21.134Z","updatedAt":"2024-05-03T22:05:21.134Z","__v":0},{"video":{"url":"https://res.cloudinary.com/dc4zgmrmf/video/upload/v1714773961/VoiceVerse/videos/6633b1bdd1f752c1fe0b3360/l2xfgpwrhfxedb6c2zmu.mp4","id":"VoiceVerse/videos/6633b1bdd1f752c1fe0b3360/l2xfgpwrhfxedb6c2zmu"},"_id":"66355fcaace8a52d27d66f9f","title":"test vid","description":"testt ","user":{"profileImage":{"url":"https://res.cloudinary.com/dc4zgmrmf/image/upload/v1710460050/VoiceVerse%20defaults/user/WhatsApp_Image_2024-03-11_at_19.05.02_iowoqo.jpg","id":"VoiceVerse%20defaults/user/userDefaultProfile"},"_id":"6633b1bdd1f752c1fe0b3360","userName":"fatmaamr"},"createdAt":"2024-05-03T22:06:02.232Z","updatedAt":"2024-05-03T22:06:02.232Z","__v":0}]

class ReelsDataModel {
  ReelsDataModel({
      bool? success, 
      List<Results>? results,}){
    _success = success;
    _results = results;
}

  ReelsDataModel.fromJson(dynamic json) {
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

/// video : {"url":"https://res.cloudinary.com/dc4zgmrmf/video/upload/v1714773695/VoiceVerse/videos/6633b1bdd1f752c1fe0b3360/bdjcmwe0dsvrormrfop0.mp4","id":"VoiceVerse/videos/6633b1bdd1f752c1fe0b3360/bdjcmwe0dsvrormrfop0"}
/// _id : "66355ec0023833b06ae7bcdd"
/// title : "boo farhet el mared"
/// user : {"profileImage":{"url":"https://res.cloudinary.com/dc4zgmrmf/image/upload/v1710460050/VoiceVerse%20defaults/user/WhatsApp_Image_2024-03-11_at_19.05.02_iowoqo.jpg","id":"VoiceVerse%20defaults/user/userDefaultProfile"},"_id":"6633b1bdd1f752c1fe0b3360","userName":"fatmaamr"}
/// description : "test vid"
/// createdAt : "2024-05-03T22:01:36.906Z"
/// updatedAt : "2024-05-03T22:01:36.906Z"
/// __v : 0

class Results {
  Results({
      Video? video, 
      String? id, 
      String? title, 
      User? user,
      String? description,
      String? createdAt,
      String? updatedAt,
      num? v,
      bool isFavorite = false
  }){
    _video = video;
    _id = id;
    _title = title;
    _user = user;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _description = description;
    _v = v;
    _isFavorite = isFavorite;
}

  bool? _isFavorite;
  bool get isFavorite => _isFavorite ?? false;

  set isFavorite(bool value) {
    _isFavorite = value; // Setter for isFavorite
  }

  Results.fromJson(dynamic json) {
    _video = json['video'] != null ? Video.fromJson(json['video']) : null;
    _id = json['_id'];
    _title = json['title'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _description = json['description'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  Video? _video;
  String? _id;
  String? _title;
  User? _user;
  String? _description;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  Video? get video => _video;
  String? get id => _id;
  String? get title => _title;
  User? get user => _user;
  String? get description => _description;
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
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['description'] = _description;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}

/// profileImage : {"url":"https://res.cloudinary.com/dc4zgmrmf/image/upload/v1710460050/VoiceVerse%20defaults/user/WhatsApp_Image_2024-03-11_at_19.05.02_iowoqo.jpg","id":"VoiceVerse%20defaults/user/userDefaultProfile"}
/// _id : "6633b1bdd1f752c1fe0b3360"
/// userName : "fatmaamr"

class User {
  User({
      ProfileImage? profileImage, 
      String? id, 
      String? userName,}){
    _profileImage = profileImage;
    _id = id;
    _userName = userName;
}

  User.fromJson(dynamic json) {
    _profileImage = json['profileImage'] != null ? ProfileImage.fromJson(json['profileImage']) : null;
    _id = json['_id'];
    _userName = json['userName'];
  }
  ProfileImage? _profileImage;
  String? _id;
  String? _userName;

  ProfileImage? get profileImage => _profileImage;
  String? get id => _id;
  String? get userName => _userName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_profileImage != null) {
      map['profileImage'] = _profileImage?.toJson();
    }
    map['_id'] = _id;
    map['userName'] = _userName;
    return map;
  }

}

/// url : "https://res.cloudinary.com/dc4zgmrmf/image/upload/v1710460050/VoiceVerse%20defaults/user/WhatsApp_Image_2024-03-11_at_19.05.02_iowoqo.jpg"
/// id : "VoiceVerse%20defaults/user/userDefaultProfile"

class ProfileImage {
  ProfileImage({
      String? url, 
      String? id,}){
    _url = url;
    _id = id;
}

  ProfileImage.fromJson(dynamic json) {
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

/// url : "https://res.cloudinary.com/dc4zgmrmf/video/upload/v1714773695/VoiceVerse/videos/6633b1bdd1f752c1fe0b3360/bdjcmwe0dsvrormrfop0.mp4"
/// id : "VoiceVerse/videos/6633b1bdd1f752c1fe0b3360/bdjcmwe0dsvrormrfop0"

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