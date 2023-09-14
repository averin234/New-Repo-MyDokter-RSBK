class GetNamaObat {
  int? code;
  String? msg;
  List<Obat>? obat;

  GetNamaObat({this.code, this.obat, this.msg});

  GetNamaObat.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['obat'] != null) {
      obat = <Obat>[];
      json['obat'].forEach((v) {
        obat!.add(Obat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (obat != null) {
      data['obat'] = obat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Obat {
  String? kodeBrg;
  String? namaBrg;
  String? jmlSatKcl;

  Obat({this.kodeBrg, this.namaBrg, this.jmlSatKcl});

  Obat.fromJson(Map<String, dynamic> json) {
    kodeBrg = json['kode_brg'];
    namaBrg = json['nama_brg'];
    jmlSatKcl = json['jml_sat_kcl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kode_brg'] = kodeBrg;
    data['nama_brg'] = namaBrg;
    data['jml_sat_kcl'] = jmlSatKcl;
    return data;
  }
}
