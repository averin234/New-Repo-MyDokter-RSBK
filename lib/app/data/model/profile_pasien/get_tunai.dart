class GetTunai {
  int? code;
  Pasien? pasien;
  String? msg;
  List<Harga>? harga;

  GetTunai({this.code, this.pasien, this.harga});

  GetTunai.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    pasien =
        json['pasien'] != null ? Pasien.fromJson(json['pasien']) : null;
    if (json['harga'] != null) {
      harga = <Harga>[];
      json['harga'].forEach((v) {
        harga!.add(Harga.fromJson(v));
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
    if (harga != null) {
      data['harga'] = harga!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pasien {
  String? namaPasien;
  String? tglLhr;
  void golDarah;
  String? almtTtpPasien;
  String? noHp;
  String? jenisKelamin;
  String? noMr;

  Pasien(
      {this.namaPasien,
      this.tglLhr,
      this.golDarah,
      this.almtTtpPasien,
      this.noHp,
      this.jenisKelamin,
      this.noMr});

  Pasien.fromJson(Map<String, dynamic> json) {
    namaPasien = json['nama_pasien'];
    tglLhr = json['tgl_lhr'];
    golDarah = json['gol_darah'];
    almtTtpPasien = json['almt_ttp_pasien'];
    noHp = json['no_hp'];
    jenisKelamin = json['jenis_kelamin'];
    noMr = json['no_mr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama_pasien'] = namaPasien;
    data['tgl_lhr'] = tglLhr;
    data['gol_darah'] = golDarah;
    data['almt_ttp_pasien'] = almtTtpPasien;
    data['no_hp'] = noHp;
    data['jenis_kelamin'] = jenisKelamin;
    data['no_mr'] = noMr;
    return data;
  }
}

class Harga {
  String? kodeBagian;
  String? namaBagian;
  String? statusSelesai;
  String? billRs;
  String? billDr1;
  void billDr2;
  void billDr3;
  void billRsAskes;
  void billDr1Askes;
  void billDr2Askes;
  void lainLain;

  Harga(
      {this.kodeBagian,
      this.namaBagian,
      this.statusSelesai,
      this.billRs,
      this.billDr1,
      this.billDr2,
      this.billDr3,
      this.billRsAskes,
      this.billDr1Askes,
      this.billDr2Askes,
      this.lainLain});

  Harga.fromJson(Map<String, dynamic> json) {
    kodeBagian = json['kode_bagian'];
    namaBagian = json['nama_bagian'];
    statusSelesai = json['status_selesai'];
    billRs = json['bill_rs'];
    billDr1 = json['bill_dr1'];
    billDr2 = json['bill_dr2'];
    billDr3 = json['bill_dr3'];
    billRsAskes = json['bill_rs_askes'];
    billDr1Askes = json['bill_dr1_askes'];
    billDr2Askes = json['bill_dr2_askes'];
    lainLain = json['lain_lain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kode_bagian'] = kodeBagian;
    data['nama_bagian'] = namaBagian;
    data['status_selesai'] = statusSelesai;
    data['bill_rs'] = billRs;
    data['bill_dr1'] = billDr1;
    data['bill_dr2'] = billDr2;
    data['bill_dr3'] = billDr3;
    data['bill_rs_askes'] = billRsAskes;
    data['bill_dr1_askes'] = billDr1Askes;
    data['bill_dr2_askes'] = billDr2Askes;
    data['lain_lain'] = lainLain;
    return data;
  }
}