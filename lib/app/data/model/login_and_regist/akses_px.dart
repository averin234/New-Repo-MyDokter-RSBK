class AksesPx {
  int? code;
  String? msg;
  Res? res;

  AksesPx({this.code, this.res, this.msg});

  AksesPx.fromJson(Map<String, dynamic> json) {
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
  int? kodeKelompok;
  String? namaKelompok;
  String? kode;

  Res({this.kodeKelompok, this.namaKelompok, this.kode});

  Res.fromJson(Map<String, dynamic> json) {
    kodeKelompok = json['kode_kelompok'];
    namaKelompok = json['nama_kelompok'];
    kode = json['kode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kode_kelompok'] = kodeKelompok;
    data['nama_kelompok'] = namaKelompok;
    data['kode'] = kode;
    return data;
  }
}
