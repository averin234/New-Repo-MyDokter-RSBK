class GetKelurahan {
  int? code;
  String? msg;
  List<Kelurahan>? kelurahan;

  GetKelurahan({this.code, this.kelurahan});

  GetKelurahan.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['kelurahan'] != null) {
      kelurahan = <Kelurahan>[];
      json['kelurahan'].forEach((v) {
        kelurahan!.add(Kelurahan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (kelurahan != null) {
      data['kelurahan'] = kelurahan!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Kelurahan {
  String? id;
  String? kelurahan;
  String? kodePos;

  Kelurahan({this.id, this.kelurahan, this.kodePos});

  Kelurahan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kelurahan = json['kelurahan'];
    kodePos = json['kode_pos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['kelurahan'] = kelurahan;
    data['kode_pos'] = kodePos;
    return data;
  }
}
