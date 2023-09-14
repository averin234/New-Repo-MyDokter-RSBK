class DaftarPxDosen {
  int? code;
  String? msg;
  Dosen? dosen;

  DaftarPxDosen({this.code, this.dosen, this.msg});

  DaftarPxDosen.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    dosen = json['dosen'] != null ? Dosen.fromJson(json['dosen']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (dosen != null) {
      data['dosen'] = dosen!.toJson();
    }
    return data;
  }
}

class Dosen {
  int? noInduk;
  int? kode;
  String? noIndukDosen;
  String? email;
  String? password;
  String? nama;
  int? idMtKaryawan;

  Dosen(
      {this.noInduk,
      this.kode,
      this.noIndukDosen,
      this.email,
      this.password,
      this.nama,
      this.idMtKaryawan});

  Dosen.fromJson(Map<String, dynamic> json) {
    noInduk = json['no_induk'];
    kode = json['kode'];
    noIndukDosen = json['no_induk_dosen'];
    email = json['email'];
    password = json['password'];
    nama = json['nama'];
    idMtKaryawan = json['id_mt_karyawan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_induk'] = noInduk;
    data['kode'] = kode;
    data['no_induk_dosen'] = noIndukDosen;
    data['email'] = email;
    data['password'] = password;
    data['nama'] = nama;
    data['id_mt_karyawan'] = idMtKaryawan;
    return data;
  }
}
