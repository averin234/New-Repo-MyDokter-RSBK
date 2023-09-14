class PostPasienBaru {
  int? code;
  String? msg;
  Pasien? pasien;
  Field? field;

  PostPasienBaru({this.code, this.msg, this.pasien, this.field});

  PostPasienBaru.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    pasien = json['pasien'] != null ? Pasien.fromJson(json['pasien']) : null;
    field = json['field'] != null ? Field.fromJson(json['field']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (pasien != null) {
      data['pasien'] = pasien!.toJson();
    }
    if (field != null) {
      data['field'] = field!.toJson();
    }
    return data;
  }
}

class Pasien {
  String? noMr;
  String? namaPasien;
  String? namaKelPasien;
  String? noKtp;
  String? tempatLahir;
  String? tglLhr;
  int? umurPasien;
  String? almtTtpPasien;
  String? idDcPropinsi;
  String? idDcKota;
  String? idDcKecamatan;
  String? idDcKelurahan;
  String? kodePos;
  String? jenKelamin;
  String? statusPerkaw;
  String? golDarah;
  String? alergi;
  String? kodeAgama;
  String? noHp;
  String? pekerjaan;
  String? email;
  String? kodePerusahaan;
  String? kodeKelompok;
  String? noAskes;
  String? noBpjs;
  int? persetujuanPasien;
  String? idDdUser;

  Pasien(
      {this.noMr,
      this.namaPasien,
      this.namaKelPasien,
      this.noKtp,
      this.tempatLahir,
      this.tglLhr,
      this.umurPasien,
      this.almtTtpPasien,
      this.idDcPropinsi,
      this.idDcKota,
      this.idDcKecamatan,
      this.idDcKelurahan,
      this.kodePos,
      this.jenKelamin,
      this.statusPerkaw,
      this.golDarah,
      this.alergi,
      this.kodeAgama,
      this.noHp,
      this.pekerjaan,
      this.email,
      this.kodePerusahaan,
      this.kodeKelompok,
      this.noAskes,
      this.noBpjs,
      this.persetujuanPasien,
      this.idDdUser});

  Pasien.fromJson(Map<String, dynamic> json) {
    noMr = json['no_mr'];
    namaPasien = json['nama_pasien'];
    namaKelPasien = json['nama_kel_pasien'];
    noKtp = json['no_ktp'];
    tempatLahir = json['tempat_lahir'];
    tglLhr = json['tgl_lhr'];
    umurPasien = json['umur_pasien'];
    almtTtpPasien = json['almt_ttp_pasien'];
    idDcPropinsi = json['id_dc_propinsi'];
    idDcKota = json['id_dc_kota'];
    idDcKecamatan = json['id_dc_kecamatan'];
    idDcKelurahan = json['id_dc_kelurahan'];
    kodePos = json['kode_pos'];
    jenKelamin = json['jen_kelamin'];
    statusPerkaw = json['status_perkaw'];
    golDarah = json['gol_darah'];
    alergi = json['alergi'];
    kodeAgama = json['kode_agama'];
    noHp = json['no_hp'];
    pekerjaan = json['pekerjaan'];
    email = json['email'];
    kodePerusahaan = json['kode_perusahaan'];
    kodeKelompok = json['kode_kelompok'];
    noAskes = json['no_askes'];
    noBpjs = json['no_bpjs'];
    persetujuanPasien = json['persetujuan_pasien'];
    idDdUser = json['id_dd_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_mr'] = noMr;
    data['nama_pasien'] = namaPasien;
    data['nama_kel_pasien'] = namaKelPasien;
    data['no_ktp'] = noKtp;
    data['tempat_lahir'] = tempatLahir;
    data['tgl_lhr'] = tglLhr;
    data['umur_pasien'] = umurPasien;
    data['almt_ttp_pasien'] = almtTtpPasien;
    data['id_dc_propinsi'] = idDcPropinsi;
    data['id_dc_kota'] = idDcKota;
    data['id_dc_kecamatan'] = idDcKecamatan;
    data['id_dc_kelurahan'] = idDcKelurahan;
    data['kode_pos'] = kodePos;
    data['jen_kelamin'] = jenKelamin;
    data['status_perkaw'] = statusPerkaw;
    data['gol_darah'] = golDarah;
    data['alergi'] = alergi;
    data['kode_agama'] = kodeAgama;
    data['no_hp'] = noHp;
    data['pekerjaan'] = pekerjaan;
    data['email'] = email;
    data['kode_perusahaan'] = kodePerusahaan;
    data['kode_kelompok'] = kodeKelompok;
    data['no_askes'] = noAskes;
    data['no_bpjs'] = noBpjs;
    data['persetujuan_pasien'] = persetujuanPasien;
    data['id_dd_user'] = idDdUser;
    return data;
  }
}

class Field {
  String? noMr;
  String? fotoPasien;

  Field({this.noMr, this.fotoPasien});

  Field.fromJson(Map<String, dynamic> json) {
    noMr = json['no_mr'];
    fotoPasien = json['foto_pasien'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_mr'] = noMr;
    data['foto_pasien'] = fotoPasien;
    return data;
  }
}
