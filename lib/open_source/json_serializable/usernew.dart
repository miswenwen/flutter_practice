/// name : "Jack"
/// email : "Rose"
/// age : "Rose"

class Usernew {
  Usernew({
      String? name, 
      String? email, 
      String? age,}){
    _name = name;
    _email = email;
    _age = age;
}

  Usernew.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _age = json['age'];
  }
  String? _name;
  String? _email;
  String? _age;
Usernew copyWith({  String? name,
  String? email,
  String? age,
}) => Usernew(  name: name ?? _name,
  email: email ?? _email,
  age: age ?? _age,
);
  String? get name => _name;
  String? get email => _email;
  String? get age => _age;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['age'] = _age;
    return map;
  }

}