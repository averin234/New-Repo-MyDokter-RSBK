class GetDetailDokter {
  int? code;
  String? msg;
  List<Dokter>? dokter;

  GetDetailDokter({this.code, this.msg, this.dokter});

  GetDetailDokter.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['dokter'] != null) {
      dokter = <Dokter>[];
      json['dokter'].forEach((v) {
        dokter!.add(Dokter.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (dokter != null) {
      data['dokter'] = dokter!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dokter {
  String? noInduk;
  String? namaPegawai;
  String? nik;
  String? fotoKtp;
  String? kodeDokter;
  String? kodeSpesialisasi;
  String? statusDr;
  String? jenisDokter;
  String? foto;
  String? kodeBagian;
  String? telp;
  String? alamat;
  String? email;
  String? flagDokter;
  String? statusDokter;
  String? nmStatusDr;
  String? tenagaMedis;
  String? fungsiDokter;
  String? namaBagian;
  String? namaSpesialisasi;

  Dokter(
      {this.noInduk,
      this.namaPegawai,
      this.nik,
      this.fotoKtp,
      this.kodeDokter,
      this.kodeSpesialisasi,
      this.statusDr,
      this.jenisDokter,
      this.foto,
      this.kodeBagian,
      this.telp,
      this.alamat,
      this.email,
      this.flagDokter,
      this.statusDokter,
      this.nmStatusDr,
      this.tenagaMedis,
      this.fungsiDokter,
      this.namaBagian,
      this.namaSpesialisasi});

  Dokter.fromJson(Map<String, dynamic> json) {
    noInduk = json['no_induk'];
    namaPegawai = json['nama_pegawai'];
    nik = json['nik'];
    fotoKtp = json['foto_ktp'];
    kodeDokter = json['kode_dokter'];
    kodeSpesialisasi = json['kode_spesialisasi'];
    statusDr = json['status_dr'];
    jenisDokter = json['jenis_dokter'];
    foto = json['foto'];
    kodeBagian = json['kode_bagian'];
    telp = json['telp'];
    alamat = json['alamat'];
    email = json['email'];
    flagDokter = json['flag_dokter'];
    statusDokter = json['status_dokter'];
    nmStatusDr = json['nm_status_dr'];
    tenagaMedis = json['tenaga_medis'];
    fungsiDokter = json['fungsi_dokter'];
    namaBagian = json['nama_bagian'];
    namaSpesialisasi = json['nama_spesialisasi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_induk'] = noInduk;
    data['nama_pegawai'] = namaPegawai;
    data['nik'] = nik;
    data['foto_ktp'] = fotoKtp;
    data['kode_dokter'] = kodeDokter;
    data['kode_spesialisasi'] = kodeSpesialisasi;
    data['status_dr'] = statusDr;
    data['jenis_dokter'] = jenisDokter;
    data['foto'] = foto;
    data['kode_bagian'] = kodeBagian;
    data['telp'] = telp;
    data['alamat'] = alamat;
    data['email'] = email;
    data['flag_dokter'] = flagDokter;
    data['status_dokter'] = statusDokter;
    data['nm_status_dr'] = nmStatusDr;
    data['tenaga_medis'] = tenagaMedis;
    data['fungsi_dokter'] = fungsiDokter;
    data['nama_bagian'] = namaBagian;
    data['nama_spesialisasi'] = namaSpesialisasi;
    return data;
  }
}
