class GetListMR {
  int? code;
  String? msg;
  List<ListMr>? listMr;

  GetListMR({this.code, this.msg, this.listMr});

  GetListMR.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['list_mr'] != null) {
      listMr = <ListMr>[];
      json['list_mr'].forEach((v) {
        listMr!.add(ListMr.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (listMr != null) {
      data['list_mr'] = listMr!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListMr {
  String? noRegistrasi;
  String? noKunjungan;
  String? noMr;
  String? tglPemeriksaan;
  String? kodeDokter;
  String? kodeBagianAsal;
  String? namaPegawai;
  String? namaBagian;

  ListMr(
      {this.noRegistrasi,
      this.noKunjungan,
      this.noMr,
      this.tglPemeriksaan,
      this.kodeDokter,
      this.kodeBagianAsal,
      this.namaPegawai,
      this.namaBagian});

  ListMr.fromJson(Map<String, dynamic> json) {
    noRegistrasi = json['no_registrasi'];
    noKunjungan = json['no_kunjungan'];
    noMr = json['no_mr'];
    tglPemeriksaan = json['tgl_pemeriksaan'];
    kodeDokter = json['kode_dokter'];
    kodeBagianAsal = json['kode_bagian_asal'];
    namaPegawai = json['nama_pegawai'];
    namaBagian = json['nama_bagian'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_registrasi'] = noRegistrasi;
    data['no_kunjungan'] = noKunjungan;
    data['no_mr'] = noMr;
    data['tgl_pemeriksaan'] = tglPemeriksaan;
    data['kode_dokter'] = kodeDokter;
    data['kode_bagian_asal'] = kodeBagianAsal;
    data['nama_pegawai'] = namaPegawai;
    data['nama_bagian'] = namaBagian;
    return data;
  }
}
