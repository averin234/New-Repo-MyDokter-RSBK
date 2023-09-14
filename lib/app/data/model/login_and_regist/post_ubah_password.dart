class PostUbahPassword {
  int? code;
  String? msg;
  Res? res;

  PostUbahPassword({this.code, this.res, this.msg});

  PostUbahPassword.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    res = json['res'] != null ? Res.fromJson(json['res']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (res != null) {
      data['res'] = res!.toJson();
    }
    return data;
  }
}

class Res {
  String? username;
  String? password;

  Res({this.username, this.password});

  Res.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
