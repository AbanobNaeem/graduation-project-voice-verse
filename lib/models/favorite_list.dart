class FavoriteList {
  FavoriteList({
    bool? success,
    Results? results,
  }) {
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
    num? v,
  }) {
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

class Videos {
  Videos({
    Id? id,
    String? url,
  }) {
    _id = id;
    _url = url;
  }

  Videos.fromJson(dynamic json) {
    _id = json['id'] != null ? Id.fromJson(json['id']) : null;
    _url = json['url'];
  }

  Id? _id;
  String? _url;

  Id? get id => _id;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_id != null) {
      map['id'] = _id?.toJson();
    }
    map['url'] = _url;
    return map;
  }
}

class Id {
  Id({
    String? id,
    String? title,
    String? url,
    String? user,
    String? description,
    String? createdAt,
    String? updatedAt,

  }) {
    _id = id;
    _title = title;
    _url = url;
    _user = user;
    _description = description;
    _createdAt = createdAt;
    _updatedAt = updatedAt;

  }

  Id.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _url = json['url'];
    _user = json['user'];
    _description = json['description'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }

  String? _id;
  String? _title;
  String? _url;
  String? _user;
  String? _description;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  String? get id => _id;
  String? get title => _title;
  String? get url => _url;
  String? get user => _user;
  String? get description => _description;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['url'] = _url;
    map['user'] = _user;
    map['description'] = _description;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}
