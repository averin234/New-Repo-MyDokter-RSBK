class DaftarPxDokter {
  int? code;
  String? msg;
  Dokter? dokter;

  DaftarPxDokter({this.code, this.dokter, this.msg});

  DaftarPxDokter.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    dokter = json['dokter'] != null ? Dokter.fromJson(json['dokter']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (dokter != null) {
      data['dokter'] = dokter!.toJson();
    }
    return data;
  }
}

class Dokter {
  int? noInduk;
  String? email;
  String? password;
  String? namaDokter;
  int? kodeDokter;
  String? sip;
  String? idMtKaryawan;

  Dokter(
      {this.noInduk,
      this.email,
      this.password,
      this.namaDokter,
      this.kodeDokter,
      this.sip,
      this.idMtKaryawan});

  Dokter.fromJson(Map<String, dynamic> json) {
    noInduk = json['no_induk'];
    email = json['email'];
    password = json['password'];
    namaDokter = json['nama_dokter'];
    kodeDokter = json['kode_dokter'];
    sip = json['sip'];
    idMtKaryawan = json['id_mt_karyawan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_induk'] = noInduk;
    data['email'] = email;
    data['password'] = password;
    data['nama_dokter'] = namaDokter;
    data['kode_dokter'] = kodeDokter;
    data['sip'] = sip;
    data['id_mt_karyawan'] = idMtKaryawan;
    return data;
  }
}
