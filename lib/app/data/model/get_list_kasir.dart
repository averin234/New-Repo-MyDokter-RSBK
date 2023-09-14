class GetListKasir {
  int? code;
  String? msg;
  List<Kasir>? kasir;

  GetListKasir({this.code, this.msg, this.kasir});

  GetListKasir.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['kasir'] != null) {
      kasir = <Kasir>[];
      json['kasir'].forEach((v) {
        kasir!.add(Kasir.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (kasir != null) {
      data['kasir'] = kasir!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Kasir {
  int? no;
  String? noRegistrasi;
  String? namaPasien;
  String? namaKelompok;
  String? jamMasuk;
  String? jamKeluar;
  String? namaBagian;
  String? billing;
  String? JenisKlamin;
  String? NoMr;
  String? Telp;
  String? Alamat;
  String? Tmptgllhr;

  Kasir(
      {this.no,
      this.noRegistrasi,
      this.namaPasien,
      this.namaKelompok,
      this.jamMasuk,
      this.jamKeluar,
      this.namaBagian,
        this.JenisKlamin,
        this.NoMr,
      this.Telp,
        this.Alamat,
        this.Tmptgllhr,
      this.billing});

  Kasir.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    noRegistrasi = json['no_registrasi'];
    namaPasien = json['nama_pasien'];
    namaKelompok = json['nama_kelompok'];
    jamMasuk = json['jam_masuk'];
    jamKeluar = json['jam_keluar'];
    namaBagian = json['nama_bagian'];
    billing = json['billing'];
    Tmptgllhr = json['tmptgllhr'];
    Telp = json['telp'];
    Alamat = json['alamat'];
    NoMr = json ['nomr'];
    JenisKlamin = json['jenisklamin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no'] = no;
    data['no_registrasi'] = noRegistrasi;
    data['nama_pasien'] = namaPasien;
    data['nama_kelompok'] = namaKelompok;
    data['jam_masuk'] = jamMasuk;
    data['jam_keluar'] = jamKeluar;
    data['nama_bagian'] = namaBagian;
    data['billing'] = billing;
    data['tmptgllhr'] = Tmptgllhr;
    data['telp'] = Telp;
    data['alamat'] = Alamat;
    data['nomr'] = NoMr;
    data['jenisklamin'] = JenisKlamin;
    return data;
  }
}
