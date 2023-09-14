class GetDetailPasien {
  int? code;
  String? msg;
  Pasien? pasien;

  GetDetailPasien({this.code, this.msg, this.pasien});

  GetDetailPasien.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    pasien = json['pasien'] != null ? Pasien.fromJson(json['pasien']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (pasien != null) {
      data['pasien'] = pasien!.toJson();
    }
    return data;
  }
}

class Pasien {
  String? noMr;
  String? namaPasien;
  String? alamat;
  String? golDarah;
  String? alergi;
  String? jenKelamin;
  String? telp;
  String? urlFotoPasien;
  String? namaKelompok;
  String? tglLhr;
  String? umur;

  Pasien(
      {this.noMr,
      this.alamat,
      this.golDarah,
      this.alergi,
      this.jenKelamin,
      this.telp,
      this.urlFotoPasien,
      this.namaKelompok,
      this.tglLhr,
      this.umur,
      this.namaPasien});

  Pasien.fromJson(Map<String, dynamic> json) {
    noMr = json['no_mr'];
    namaPasien = json['nama_pasien'];
    alamat = json['alamat'];
    golDarah = json['gol_darah'];
    alergi = json['alergi'];
    jenKelamin = json['jen_kelamin'];
    telp = json['telp'];
    urlFotoPasien = json['url_foto_pasien'];
    namaKelompok = json['nama_kelompok'];
    tglLhr = json['tgl_lhr'];
    umur = json['umur'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_mr'] = noMr;
    data['nama_pasien'] = namaPasien;
    data['alamat'] = alamat;
    data['gol_darah'] = golDarah;
    data['alergi'] = alergi;
    data['jen_kelamin'] = jenKelamin;
    data['telp'] = telp;
    data['url_foto_pasien'] = urlFotoPasien;
    data['nama_kelompok'] = namaKelompok;
    data['tgl_lhr'] = tglLhr;
    data['umur'] = umur;
    return data;
  }
}
