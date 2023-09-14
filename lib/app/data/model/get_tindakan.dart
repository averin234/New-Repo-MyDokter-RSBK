class GetTindakan {
  int? code;
  String? msg;
  List<Tindakan>? tindakan;

  GetTindakan({this.code, this.msg, this.tindakan});

  GetTindakan.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['tindakan'] != null) {
      tindakan = <Tindakan>[];
      json['tindakan'].forEach((v) {
        tindakan!.add(Tindakan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (tindakan != null) {
      data['tindakan'] = tindakan!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tindakan {
  String? kodeTarif;
  String? kodeTindakan;
  String? namaTarif;

  Tindakan({this.kodeTarif, this.kodeTindakan, this.namaTarif});

  Tindakan.fromJson(Map<String, dynamic> json) {
    kodeTarif = json['kode_tarif'];
    kodeTindakan = json['kode_tindakan'];
    namaTarif = json['nama_tarif'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kode_tarif'] = kodeTarif;
    data['kode_tindakan'] = kodeTindakan;
    data['nama_tarif'] = namaTarif;
    return data;
  }
}
