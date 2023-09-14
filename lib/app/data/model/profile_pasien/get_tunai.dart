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
        json['pasien'] != null ? new Pasien.fromJson(json['pasien']) : null;
    if (json['harga'] != null) {
      harga = <Harga>[];
      json['harga'].forEach((v) {
        harga!.add(new Harga.fromJson(v));
      });
    }
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = msg;
    if (this.pasien != null) {
      data['pasien'] = this.pasien!.toJson();
    }
    if (this.harga != null) {
      data['harga'] = this.harga!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pasien {
  String? namaPasien;
  String? tglLhr;
  Null? golDarah;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama_pasien'] = this.namaPasien;
    data['tgl_lhr'] = this.tglLhr;
    data['gol_darah'] = this.golDarah;
    data['almt_ttp_pasien'] = this.almtTtpPasien;
    data['no_hp'] = this.noHp;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['no_mr'] = this.noMr;
    return data;
  }
}

class Harga {
  String? kodeBagian;
  String? namaBagian;
  String? statusSelesai;
  String? billRs;
  String? billDr1;
  Null? billDr2;
  Null? billDr3;
  Null? billRsAskes;
  Null? billDr1Askes;
  Null? billDr2Askes;
  Null? lainLain;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kode_bagian'] = this.kodeBagian;
    data['nama_bagian'] = this.namaBagian;
    data['status_selesai'] = this.statusSelesai;
    data['bill_rs'] = this.billRs;
    data['bill_dr1'] = this.billDr1;
    data['bill_dr2'] = this.billDr2;
    data['bill_dr3'] = this.billDr3;
    data['bill_rs_askes'] = this.billRsAskes;
    data['bill_dr1_askes'] = this.billDr1Askes;
    data['bill_dr2_askes'] = this.billDr2Askes;
    data['lain_lain'] = this.lainLain;
    return data;
  }
}