/// success : true
/// result : {"profileImage":{"url":"https://res.cloudinary.com/dc4zgmrmf/image/upload/v1710882845/VoiceVerse/ProfilePics/65f306b4c00532ac5b4ee304/xEkvNZSJRC8Wj6mJ7gIKA/kjazy9m89yfbavhmq503.jpg","id":"VoiceVerse/ProfilePics/65f306b4c00532ac5b4ee304/xEkvNZSJRC8Wj6mJ7gIKA/kjazy9m89yfbavhmq503"},"_id":"65f306b4c00532ac5b4ee304","userName":"Abanob naeem ","email":"abanobnaeem80@gmail.com","password":"$2a$08$anqnHX6tvupxvUti4JOEjuaRnCvXCLI1MS8GZRONj40k.iY9.NoMK","isConfirmed":true,"createdAt":"2024-03-14T14:16:20.290Z","updatedAt":"2024-03-22T21:05:24.397Z","__v":0,"accountStatus":"Free","forgetCode":"31797"}

class UserDataModel {
  UserDataModel({
      bool? success, 
      Result? result,}){
    _success = success;
    _result = result;
}

  UserDataModel.fromJson(dynamic json) {
    _success = json['success'];
    _result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
  bool? _success;
  Result? _result;

  bool? get success => _success;
  Result? get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_result != null) {
      map['result'] = _result?.toJson();
    }
    return map;
  }

}

/// profileImage : {"url":"https://res.cloudinary.com/dc4zgmrmf/image/upload/v1710882845/VoiceVerse/ProfilePics/65f306b4c00532ac5b4ee304/xEkvNZSJRC8Wj6mJ7gIKA/kjazy9m89yfbavhmq503.jpg","id":"VoiceVerse/ProfilePics/65f306b4c00532ac5b4ee304/xEkvNZSJRC8Wj6mJ7gIKA/kjazy9m89yfbavhmq503"}
/// _id : "65f306b4c00532ac5b4ee304"
/// userName : "Abanob naeem "
/// email : "abanobnaeem80@gmail.com"
/// password : "$2a$08$anqnHX6tvupxvUti4JOEjuaRnCvXCLI1MS8GZRONj40k.iY9.NoMK"
/// isConfirmed : true
/// createdAt : "2024-03-14T14:16:20.290Z"
/// updatedAt : "2024-03-22T21:05:24.397Z"
/// __v : 0
/// accountStatus : "Free"
/// forgetCode : "31797"

class Result {
  Result({
      ProfileImage? profileImage, 
      String? id, 
      String? userName, 
      String? email, 
      String? password, 
      bool? isConfirmed, 
      String? createdAt, 
      String? updatedAt, 
      num? v, 
      String? accountStatus, 
      String? forgetCode,}){
    _profileImage = profileImage;
    _id = id;
    _userName = userName;
    _email = email;
    _password = password;
    _isConfirmed = isConfirmed;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _accountStatus = accountStatus;
    _forgetCode = forgetCode;
}

  Result.fromJson(dynamic json) {
    _profileImage = json['profileImage'] != null ? ProfileImage.fromJson(json['profileImage']) : null;
    _id = json['_id'];
    _userName = json['userName'];
    _email = json['email'];
    _password = json['password'];
    _isConfirmed = json['isConfirmed'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _accountStatus = json['accountStatus'];
    _forgetCode = json['forgetCode'];
  }
  ProfileImage? _profileImage;
  String? _id;
  String? _userName;
  String? _email;
  String? _password;
  bool? _isConfirmed;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  String? _accountStatus;
  String? _forgetCode;

  ProfileImage? get profileImage => _profileImage;
  String? get id => _id;
  String? get userName => _userName;
  String? get email => _email;
  String? get password => _password;
  bool? get isConfirmed => _isConfirmed;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;
  String? get accountStatus => _accountStatus;
  String? get forgetCode => _forgetCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_profileImage != null) {
      map['profileImage'] = _profileImage?.toJson();
    }
    map['_id'] = _id;
    map['userName'] = _userName;
    map['email'] = _email;
    map['password'] = _password;
    map['isConfirmed'] = _isConfirmed;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    map['accountStatus'] = _accountStatus;
    map['forgetCode'] = _forgetCode;
    return map;
  }

}

/// url : "https://res.cloudinary.com/dc4zgmrmf/image/upload/v1710882845/VoiceVerse/ProfilePics/65f306b4c00532ac5b4ee304/xEkvNZSJRC8Wj6mJ7gIKA/kjazy9m89yfbavhmq503.jpg"
/// id : "VoiceVerse/ProfilePics/65f306b4c00532ac5b4ee304/xEkvNZSJRC8Wj6mJ7gIKA/kjazy9m89yfbavhmq503"

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