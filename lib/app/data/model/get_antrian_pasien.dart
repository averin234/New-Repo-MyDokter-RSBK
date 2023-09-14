class GetAntrianPasien {
  int? code;
  String? msg;
  List<Antrian>? antrian;

  GetAntrianPasien({this.code, this.msg, this.antrian});

  GetAntrianPasien.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['antrian'] != null) {
      antrian = <Antrian>[];
      json['antrian'].forEach((v) {
        antrian!.add(Antrian.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (antrian != null) {
      data['antrian'] = antrian!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Antrian {
  String? noMr;
  String? noRegistrasi;
  String? noKunjungan;
  String? noAntrian;
  String? kodeDokter;
  String? namaDokter;
  String? kodeBagian;
  String? alamat;
  String? fotoPasien;
  String? namaPasien;
  String? jenisKelamin;
  String? tglJamPoli;
  String? golDarah;
  String? alergi;
  String? noHp;
  String? umur;

  Antrian(
      {this.noMr,
      this.noRegistrasi,
      this.noKunjungan,
      this.noAntrian,
      this.kodeDokter,
      this.namaDokter,
      this.kodeBagian,
      this.alamat,
      this.fotoPasien,
      this.namaPasien,
      this.jenisKelamin,
      this.tglJamPoli,
      this.golDarah,
      this.alergi,
      this.noHp,
      this.umur});

  Antrian.fromJson(Map<String, dynamic> json) {
    noMr = json['no_mr'];
    noRegistrasi = json['no_registrasi'];
    noKunjungan = json['no_kunjungan'];
    noAntrian = json['no_antrian'];
    kodeDokter = json['kode_dokter'];
    namaDokter = json['nama_dokter'];
    kodeBagian = json['kode_bagian'];
    alamat = json['alamat'];
    fotoPasien = json['foto_pasien'];
    namaPasien = json['nama_pasien'];
    jenisKelamin = json['jenis_kelamin'];
    tglJamPoli = json['tgl_jam_poli'];
    golDarah = json['gol_darah'];
    alergi = json['alergi'];
    noHp = json['no_hp'];
    umur = json['umur'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_mr'] = noMr;
    data['no_registrasi'] = noRegistrasi;
    data['no_kunjungan'] = noKunjungan;
    data['no_antrian'] = noAntrian;
    data['kode_dokter'] = kodeDokter;
    data['nama_dokter'] = namaDokter;
    data['kode_bagian'] = kodeBagian;
    data['alamat'] = alamat;
    data['foto_pasien'] = fotoPasien;
    data['nama_pasien'] = namaPasien;
    data['jenis_kelamin'] = jenisKelamin;
    data['tgl_jam_poli'] = tglJamPoli;
    data['gol_darah'] = golDarah;
    data['alergi'] = alergi;
    data['no_hp'] = noHp;
    data['umur'] = umur;
    return data;
  }
}
