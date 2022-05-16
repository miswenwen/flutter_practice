/// @meta : {"import":["test_dir/profile.dart"],"comments":{"name":"名字"},"nullable":false,"ignore":false}
/// @JsonKey(ignore: true) Profile? : "profile"
/// @JsonKey(name: '+1') int? : "loved"
/// name : "wendux"
/// father : "$user"
/// friends : "$[]user"
/// keywords : "$[]String"
/// age? : 20

class Test {
  Test({
      @meta meta, 
      String JsonKeyignoretrueProfile, 
      String JsonKeyname1int, 
      String name, 
      String father, 
      String friends, 
      String keywords, 
      int age,}){
    _meta = meta;
    _JsonKeyignoretrueProfile = JsonKeyignoretrueProfile;
    _JsonKeyname1int = JsonKeyname1int;
    _name = name;
    _father = father;
    _friends = friends;
    _keywords = keywords;
    _age = age;
}

  Test.fromJson(dynamic json) {
    _meta = json['@meta'] != null ? @meta.fromJson(json['@meta']) : null;
    _JsonKeyignoretrueProfile = json['@JsonKey(ignore: true) Profile?'];
    _JsonKeyname1int = json['@JsonKey(name: '+1') int?'];
    _name = json['name'];
    _father = json['father'];
    _friends = json['friends'];
    _keywords = json['keywords'];
    _age = json['age?'];
  }
  @meta _meta;
  String _JsonKeyignoretrueProfile;
  String _JsonKeyname1int;
  String _name;
  String _father;
  String _friends;
  String _keywords;
  int _age;
Test copyWith({  @meta meta,
  String JsonKeyignoretrueProfile,
  String JsonKeyname1int,
  String name,
  String father,
  String friends,
  String keywords,
  int age,
}) => Test(  meta: meta ?? _meta,
  JsonKeyignoretrueProfile: JsonKeyignoretrueProfile ?? _JsonKeyignoretrueProfile,
  JsonKeyname1int: JsonKeyname1int ?? _JsonKeyname1int,
  name: name ?? _name,
  father: father ?? _father,
  friends: friends ?? _friends,
  keywords: keywords ?? _keywords,
  age: age ?? _age,
);
  @meta get meta => _meta;
  String get JsonKeyignoretrueProfile => _JsonKeyignoretrueProfile;
  String get JsonKeyname1int => _JsonKeyname1int;
  String get name => _name;
  String get father => _father;
  String get friends => _friends;
  String get keywords => _keywords;
  int get age => _age;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_meta != null) {
      map['@meta'] = _meta.toJson();
    }
    map['@JsonKey(ignore: true) Profile?'] = _JsonKeyignoretrueProfile;
    map['@JsonKey(name: '+1') int?'] = _JsonKeyname1int;
    map['name'] = _name;
    map['father'] = _father;
    map['friends'] = _friends;
    map['keywords'] = _keywords;
    map['age?'] = _age;
    return map;
  }

}

/// import : ["test_dir/profile.dart"]
/// comments : {"name":"名字"}
/// nullable : false
/// ignore : false

class @meta {
  @meta({
      List<String> import, 
      Comments comments, 
      bool nullable, 
      bool ignore,}){
    _import = import;
    _comments = comments;
    _nullable = nullable;
    _ignore = ignore;
}

  @meta.fromJson(dynamic json) {
    _import = json['import'] != null ? json['import'].cast<String>() : [];
    _comments = json['comments'] != null ? Comments.fromJson(json['comments']) : null;
    _nullable = json['nullable'];
    _ignore = json['ignore'];
  }
  List<String> _import;
  Comments _comments;
  bool _nullable;
  bool _ignore;
@meta copyWith({  List<String> import,
  Comments comments,
  bool nullable,
  bool ignore,
}) => @meta(  import: import ?? _import,
  comments: comments ?? _comments,
  nullable: nullable ?? _nullable,
  ignore: ignore ?? _ignore,
);
  List<String> get import => _import;
  Comments get comments => _comments;
  bool get nullable => _nullable;
  bool get ignore => _ignore;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['import'] = _import;
    if (_comments != null) {
      map['comments'] = _comments.toJson();
    }
    map['nullable'] = _nullable;
    map['ignore'] = _ignore;
    return map;
  }

}

/// name : "名字"

class Comments {
  Comments({
      String name,}){
    _name = name;
}

  Comments.fromJson(dynamic json) {
    _name = json['name'];
  }
  String _name;
Comments copyWith({  String name,
}) => Comments(  name: name ?? _name,
);
  String get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    return map;
  }

}