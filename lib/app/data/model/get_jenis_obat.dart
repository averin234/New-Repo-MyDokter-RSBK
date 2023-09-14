class GetJenisObat {
  int? code;
  String? msg;
  List<JenisObat>? jenisObat;

  GetJenisObat({this.code, this.msg, this.jenisObat});

  GetJenisObat.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['jenis_obat'] != null) {
      jenisObat = <JenisObat>[];
      json['jenis_obat'].forEach((v) {
        jenisObat!.add(JenisObat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (jenisObat != null) {
      data['jenis_obat'] = jenisObat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JenisObat {
  String? idDcKesediaanObat;
  String? namaKesediaan;
  String? satuan;

  JenisObat({this.idDcKesediaanObat, this.namaKesediaan, this.satuan});

  JenisObat.fromJson(Map<String, dynamic> json) {
    idDcKesediaanObat = json['id_dc_kesediaan_obat'];
    namaKesediaan = json['nama_kesediaan'];
    satuan = json['satuan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_dc_kesediaan_obat'] = idDcKesediaanObat;
    data['nama_kesediaan'] = namaKesediaan;
    data['satuan'] = satuan;
    return data;
  }
}
