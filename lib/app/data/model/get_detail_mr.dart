class GetDetailMR {
  int? code;
  String? msg;
  Pasien? pasien;
  VitalSign? vitalSign;
  RiwayatPemeriksaan? riwayatPemeriksaan;
  List<Tindakan>? tindakan;
  List<Icd10>? icd10;
  List<Resep>? resep;

  GetDetailMR(
      {this.code,
      this.msg,
      this.pasien,
      this.vitalSign,
      this.riwayatPemeriksaan,
      this.tindakan,
      this.icd10,
      this.resep});

  GetDetailMR.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    pasien = json['pasien'] != null ? Pasien.fromJson(json['pasien']) : null;
    vitalSign = json['vital_sign'] != null
        ? VitalSign.fromJson(json['vital_sign'])
        : null;
    riwayatPemeriksaan = json['riwayat_pemeriksaan'] != null
        ? RiwayatPemeriksaan.fromJson(json['riwayat_pemeriksaan'])
        : null;
    if (json['tindakan'] != null) {
      tindakan = <Tindakan>[];
      json['tindakan'].forEach((v) {
        tindakan!.add(Tindakan.fromJson(v));
      });
    }
    if (json['icd10'] != null) {
      icd10 = <Icd10>[];
      json['icd10'].forEach((v) {
        icd10!.add(Icd10.fromJson(v));
      });
    }
    if (json['resep'] != null) {
      resep = <Resep>[];
      json['resep'].forEach((v) {
        resep!.add(Resep.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (pasien != null) {
      data['pasien'] = pasien!.toJson();
    }
    if (vitalSign != null) {
      data['vital_sign'] = vitalSign!.toJson();
    }
    if (riwayatPemeriksaan != null) {
      data['riwayat_pemeriksaan'] = riwayatPemeriksaan!.toJson();
    }
    if (tindakan != null) {
      data['tindakan'] = tindakan!.map((v) => v.toJson()).toList();
    }
    if (icd10 != null) {
      data['icd10'] = icd10!.map((v) => v.toJson()).toList();
    }
    if (resep != null) {
      data['resep'] = resep!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pasien {
  String? noMr;
  String? urlFotoPasien;
  String? namaPasien;
  String? golDarah;
  String? jenKelamin;
  String? tglLhr;
  String? alergi;
  String? alamat;
  String? provinsi;
  String? kota;
  String? kecamatan;
  String? kelurahan;
  String? umur;
  String? kodePos;

  Pasien(
      {this.noMr,
      this.urlFotoPasien,
      this.namaPasien,
      this.golDarah,
      this.jenKelamin,
      this.tglLhr,
      this.alergi,
      this.alamat,
      this.provinsi,
      this.kota,
      this.kecamatan,
      this.kelurahan,
      this.umur,
      this.kodePos});

  Pasien.fromJson(Map<String, dynamic> json) {
    noMr = json['no_mr'];
    urlFotoPasien = json['foto'];
    namaPasien = json['nama_pasien'];
    golDarah = json['gol_darah'];
    jenKelamin = json['jen_kelamin'];
    tglLhr = json['tgl_lhr'];
    alergi = json['alergi'];
    alamat = json['alamat'];
    provinsi = json['provinsi'];
    kota = json['kota'];
    kecamatan = json['kecamatan'];
    kelurahan = json['kelurahan'];
    umur = json['umur'];
    kodePos = json['kode_pos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_mr'] = noMr;
    data['foto'] = urlFotoPasien;
    data['nama_pasien'] = namaPasien;
    data['gol_darah'] = golDarah;
    data['jen_kelamin'] = jenKelamin;
    data['tgl_lhr'] = tglLhr;
    data['alergi'] = alergi;
    data['alamat'] = alamat;
    data['provinsi'] = provinsi;
    data['kota'] = kota;
    data['kecamatan'] = kecamatan;
    data['kelurahan'] = kelurahan;
    data['umur'] = umur;
    data['kode_pos'] = kodePos;
    return data;
  }
}

class VitalSign {
  String? keadaanUmum;
  String? kesadaranPasien;
  String? tekananDarah;
  String? nadi;
  String? suhu;
  String? pernafasan;
  String? tinggiBadan;
  String? beratBadan;

  VitalSign(
      {this.keadaanUmum,
      this.kesadaranPasien,
      this.tekananDarah,
      this.nadi,
      this.suhu,
      this.pernafasan,
      this.tinggiBadan,
      this.beratBadan});

  VitalSign.fromJson(Map<String, dynamic> json) {
    keadaanUmum = json['keadaan_umum'];
    kesadaranPasien = json['kesadaran_pasien'];
    tekananDarah = json['tekanan_darah'];
    nadi = json['nadi'];
    suhu = json['suhu'];
    pernafasan = json['pernafasan'];
    tinggiBadan = json['tinggi_badan'];
    beratBadan = json['berat_badan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['keadaan_umum'] = keadaanUmum;
    data['kesadaran_pasien'] = kesadaranPasien;
    data['tekanan_darah'] = tekananDarah;
    data['nadi'] = nadi;
    data['suhu'] = suhu;
    data['pernafasan'] = pernafasan;
    data['tinggi_badan'] = tinggiBadan;
    data['berat_badan'] = beratBadan;
    return data;
  }
}

class RiwayatPemeriksaan {
  String? subyektive;
  String? analyst;
  String? objective;

  RiwayatPemeriksaan({this.subyektive, this.analyst, this.objective});

  RiwayatPemeriksaan.fromJson(Map<String, dynamic> json) {
    subyektive = json['Subyektive'];
    analyst = json['Analyst'];
    objective = json['Objective'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Subyektive'] = subyektive;
    data['Analyst'] = analyst;
    data['Objective'] = objective;
    return data;
  }
}

class Tindakan {
  String? idPelayanan;
  String? namaTindakan;
  int? biaya;
  String? tanggal;
  int? no;

  Tindakan(
      {this.idPelayanan, this.namaTindakan, this.biaya, this.tanggal, this.no});

  Tindakan.fromJson(Map<String, dynamic> json) {
    idPelayanan = json['id_pelayanan'];
    namaTindakan = json['nama_tindakan'];
    biaya = json['biaya'];
    tanggal = json['tanggal'];
    no = json['no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_pelayanan'] = idPelayanan;
    data['nama_tindakan'] = namaTindakan;
    data['biaya'] = biaya;
    data['tanggal'] = tanggal;
    data['no'] = no;
    return data;
  }
}

class Icd10 {
  String? idIcdPasien;
  String? kodeIcd;
  String? kelompokIcd;
  String? kodeAsterik;
  int? no;
  String? namaAsterik;
  String? namaKelompok;
  String? namaIcd10;

  Icd10(
      {this.idIcdPasien,
      this.kodeIcd,
      this.kelompokIcd,
      this.kodeAsterik,
      this.no,
      this.namaAsterik,
      this.namaKelompok,
      this.namaIcd10});

  Icd10.fromJson(Map<String, dynamic> json) {
    idIcdPasien = json['id_icd_pasien'];
    kodeIcd = json['kode_icd'];
    kelompokIcd = json['kelompok_icd'];
    kodeAsterik = json['kode_asterik'];
    no = json['no'];
    namaAsterik = json['nama_asterik'];
    namaKelompok = json['nama_kelompok'];
    namaIcd10 = json['nama_icd10'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_icd_pasien'] = idIcdPasien;
    data['kode_icd'] = kodeIcd;
    data['kelompok_icd'] = kelompokIcd;
    data['kode_asterik'] = kodeAsterik;
    data['no'] = no;
    data['nama_asterik'] = namaAsterik;
    data['nama_kelompok'] = namaKelompok;
    data['nama_icd10'] = namaIcd10;
    return data;
  }
}

class Resep {
  String? idResep;
  String? idObat;
  String? namaBrg;
  String? note;
  String? satuan;
  String? namaDosis;
  String? jumlahPesan;
  String? ket;
  int? no;

  Resep(
      {this.idResep,
      this.idObat,
      this.namaBrg,
      this.note,
      this.satuan,
      this.namaDosis,
      this.jumlahPesan,
      this.ket,
      this.no});

  Resep.fromJson(Map<String, dynamic> json) {
    idResep = json['id_resep'];
    idObat = json['id_obat'];
    namaBrg = json['nama_brg'];
    note = json['note'];
    satuan = json['satuan'];
    namaDosis = json['nama_dosis'];
    jumlahPesan = json['jumlah_pesan'];
    ket = json['ket'];
    no = json['no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_resep'] = idResep;
    data['id_obat'] = idObat;
    data['nama_brg'] = namaBrg;
    data['note'] = note;
    data['satuan'] = satuan;
    data['nama_dosis'] = namaDosis;
    data['jumlah_pesan'] = jumlahPesan;
    data['ket'] = ket;
    data['no'] = no;
    return data;
  }
}
