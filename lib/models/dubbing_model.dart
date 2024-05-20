/// _id : "664b2b2dcdb4f0b5eecd3fa7"
/// user : "663f6815a70248856d260552"
/// dubbedAudio : [{"title":"test","description":"test","translatedText":"test","audioUrl":"link","originalVideo":"link","_id":"664b2b2dcdb4f0b5eecd3fa8"}]
/// createdAt : "2024-05-20T10:51:25.815Z"
/// updatedAt : "2024-05-20T10:51:25.815Z"
/// __v : 0

class DubbingModel {
  DubbingModel({
      String? id, 
      String? user, 
      List<DubbedAudio>? dubbedAudio, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _id = id;
    _user = user;
    _dubbedAudio = dubbedAudio;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  DubbingModel.fromJson(dynamic json) {
    _id = json['_id'];
    _user = json['user'];
    if (json['dubbedAudio'] != null) {
      _dubbedAudio = [];
      json['dubbedAudio'].forEach((v) {
        _dubbedAudio?.add(DubbedAudio.fromJson(v));
      });
    }
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _user;
  List<DubbedAudio>? _dubbedAudio;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  String? get id => _id;
  String? get user => _user;
  List<DubbedAudio>? get dubbedAudio => _dubbedAudio;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['user'] = _user;
    if (_dubbedAudio != null) {
      map['dubbedAudio'] = _dubbedAudio?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}

/// title : "test"
/// description : "test"
/// translatedText : "test"
/// audioUrl : "link"
/// originalVideo : "link"
/// _id : "664b2b2dcdb4f0b5eecd3fa8"

class DubbedAudio {
  DubbedAudio({
      String? title, 
      String? description, 
      String? translatedText, 
      String? audioUrl, 
      String? originalVideo, 
      String? id,}){
    _title = title;
    _description = description;
    _translatedText = translatedText;
    _audioUrl = audioUrl;
    _originalVideo = originalVideo;
    _id = id;
}

  DubbedAudio.fromJson(dynamic json) {
    _title = json['title'];
    _description = json['description'];
    _translatedText = json['translatedText'];
    _audioUrl = json['audioUrl'];
    _originalVideo = json['originalVideo'];
    _id = json['_id'];
  }
  String? _title;
  String? _description;
  String? _translatedText;
  String? _audioUrl;
  String? _originalVideo;
  String? _id;

  String? get title => _title;
  String? get description => _description;
  String? get translatedText => _translatedText;
  String? get audioUrl => _audioUrl;
  String? get originalVideo => _originalVideo;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['description'] = _description;
    map['translatedText'] = _translatedText;
    map['audioUrl'] = _audioUrl;
    map['originalVideo'] = _originalVideo;
    map['_id'] = _id;
    return map;
  }

}