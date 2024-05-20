/// _id : "664b3aa85b3c128821cbbbc7"
/// user : "663f6815a70248856d260552"
/// clonedAudio : [{"title":"test9","textToSpeech":"اسمي أدريانا أنا محترف في الموارد البشرية مع سجل حافل والمساعدة في تحديد وتوظيف المواهب رفيعة المستوى في الإدارة","audioUrl":"https://voice-verse-bucket.s3.amazonaws.com/media/audio/tes_b4ESTlX.wav","_id":"664b3aa85b3c128821cbbbc8"},{"title":"test9","textToSpeech":"انا اسمي فاطمه عمرو مصطفى واحب اللوبيا","audioUrl":"https://voice-verse-bucket.s3.amazonaws.com/media/audio/tes_eJdqcxq.wav","_id":"664b3c873bf8f5c0d1afa898"},{"title":"test9","textToSpeech":"انا اسمي فاطمه عمرو مصطفى واحب اللوبيا","audioUrl":"https://voice-verse-bucket.s3.amazonaws.com/media/audio/tes_TC7NLnh.wav","_id":"664b3cebc5374ac258282164"}]
/// createdAt : "2024-05-20T11:57:28.418Z"
/// updatedAt : "2024-05-20T12:07:07.945Z"
/// __v : 0

class CloningModel {
  CloningModel({
      String? id, 
      String? user, 
      List<ClonedAudio>? clonedAudio, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _id = id;
    _user = user;
    _clonedAudio = clonedAudio;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  CloningModel.fromJson(dynamic json) {
    _id = json['_id'];
    _user = json['user'];
    if (json['clonedAudio'] != null) {
      _clonedAudio = [];
      json['clonedAudio'].forEach((v) {
        _clonedAudio?.add(ClonedAudio.fromJson(v));
      });
    }
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _user;
  List<ClonedAudio>? _clonedAudio;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  String? get id => _id;
  String? get user => _user;
  List<ClonedAudio>? get clonedAudio => _clonedAudio;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['user'] = _user;
    if (_clonedAudio != null) {
      map['clonedAudio'] = _clonedAudio?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}

/// title : "test9"
/// textToSpeech : "اسمي أدريانا أنا محترف في الموارد البشرية مع سجل حافل والمساعدة في تحديد وتوظيف المواهب رفيعة المستوى في الإدارة"
/// audioUrl : "https://voice-verse-bucket.s3.amazonaws.com/media/audio/tes_b4ESTlX.wav"
/// _id : "664b3aa85b3c128821cbbbc8"

class ClonedAudio {
  ClonedAudio({
      String? title, 
      String? textToSpeech, 
      String? audioUrl, 
      String? id,}){
    _title = title;
    _textToSpeech = textToSpeech;
    _audioUrl = audioUrl;
    _id = id;
}

  ClonedAudio.fromJson(dynamic json) {
    _title = json['title'];
    _textToSpeech = json['textToSpeech'];
    _audioUrl = json['audioUrl'];
    _id = json['_id'];
  }
  String? _title;
  String? _textToSpeech;
  String? _audioUrl;
  String? _id;

  String? get title => _title;
  String? get textToSpeech => _textToSpeech;
  String? get audioUrl => _audioUrl;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['textToSpeech'] = _textToSpeech;
    map['audioUrl'] = _audioUrl;
    map['_id'] = _id;
    return map;
  }

}