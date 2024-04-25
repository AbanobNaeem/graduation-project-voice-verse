/// success : true
/// results : [{"_id":"66006aab65d163dea5a3da2f","title":"30sec video","url":"https://res.cloudinary.com/dc4zgmrmf/video/upload/v1710941817/VoiceVerse/The_30-Second_Video_aj2dkt.mp4","user":{"profileImage":{"url":"https://res.cloudinary.com/dc4zgmrmf/image/upload/v1710460050/VoiceVerse%20defaults/user/WhatsApp_Image_2024-03-11_at_19.05.02_iowoqo.jpg","id":"VoiceVerse%20defaults/user/userDefaultProfile"},"_id":"65f5a9e580c94a9263a4fc31","userName":"fatmaamr"},"description":"test vid","createdAt":"2024-03-24T18:02:19.074Z","updatedAt":"2024-03-24T18:02:19.074Z","__v":0},{"_id":"66006c2b65d163dea5a3da34","title":"rainy day","url":"https://res.cloudinary.com/dc4zgmrmf/video/upload/v1711303674/VoiceVerse/Rainy_Day_short_30_sec_animation_x70s4g.mp4","user":{"profileImage":{"url":"https://res.cloudinary.com/dc4zgmrmf/image/upload/v1710460050/VoiceVerse%20defaults/user/WhatsApp_Image_2024-03-11_at_19.05.02_iowoqo.jpg","id":"VoiceVerse%20defaults/user/userDefaultProfile"},"_id":"65f5a9e580c94a9263a4fc31","userName":"fatmaamr"},"description":"2nd test vid","createdAt":"2024-03-24T18:08:43.329Z","updatedAt":"2024-03-24T18:08:43.329Z","__v":0},{"_id":"66006d0565d163dea5a3da39","title":"animation","url":"https://res.cloudinary.com/dc4zgmrmf/video/upload/v1711303606/VoiceVerse/30_second_animation_assignment_mhc2b8.mp4","user":{"profileImage":{"url":"https://res.cloudinary.com/dc4zgmrmf/image/upload/v1710460050/VoiceVerse%20defaults/user/WhatsApp_Image_2024-03-11_at_19.05.02_iowoqo.jpg","id":"VoiceVerse%20defaults/user/userDefaultProfile"},"_id":"65f5a9e580c94a9263a4fc31","userName":"fatmaamr"},"description":"3rd test vid","createdAt":"2024-03-24T18:12:21.330Z","updatedAt":"2024-03-24T18:12:21.330Z","__v":0}]

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

/// _id : "66006aab65d163dea5a3da2f"
/// title : "30sec video"
/// url : "https://res.cloudinary.com/dc4zgmrmf/video/upload/v1710941817/VoiceVerse/The_30-Second_Video_aj2dkt.mp4"
/// user : {"profileImage":{"url":"https://res.cloudinary.com/dc4zgmrmf/image/upload/v1710460050/VoiceVerse%20defaults/user/WhatsApp_Image_2024-03-11_at_19.05.02_iowoqo.jpg","id":"VoiceVerse%20defaults/user/userDefaultProfile"},"_id":"65f5a9e580c94a9263a4fc31","userName":"fatmaamr"}
/// description : "test vid"
/// createdAt : "2024-03-24T18:02:19.074Z"
/// updatedAt : "2024-03-24T18:02:19.074Z"
/// __v : 0

class Results {
  Results({
      String? id, 
      String? title, 
      String? url, 
      User? user, 
      String? description, 
      String? createdAt, 
      String? updatedAt,
      num? v,
      bool isFavorite = false
  }){
    _id = id;
    _title = title;
    _url = url;
    _user = user;
    _description = description;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _isFavorite = isFavorite;

  }
  bool? _isFavorite;
  bool get isFavorite => _isFavorite ?? false;

  set isFavorite(bool value) {
    _isFavorite = value; // Setter for isFavorite
  }
  Results.fromJson(dynamic json) {
    _id = json['_id'];
    _title = json['title'];
    _url = json['url'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _description = json['description'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _title;
  String? _url;
  User? _user;
  String? _description;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  String? get id => _id;
  String? get title => _title;
  String? get url => _url;
  User? get user => _user;
  String? get description => _description;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['title'] = _title;
    map['url'] = _url;
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
/// _id : "65f5a9e580c94a9263a4fc31"
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