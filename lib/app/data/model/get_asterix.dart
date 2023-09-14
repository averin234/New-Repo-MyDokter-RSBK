class GetAsterix {
  int? code;
  String? msg;
  List<AsterikIcd10>? asterikIcd10;

  GetAsterix({this.code, this.msg, this.asterikIcd10});

  GetAsterix.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['asterik_icd10'] != null) {
      asterikIcd10 = <AsterikIcd10>[];
      json['asterik_icd10'].forEach((v) {
        asterikIcd10!.add(AsterikIcd10.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (asterikIcd10 != null) {
      data['asterik_icd10'] = asterikIcd10!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AsterikIcd10 {
  String? icd10;
  String? namaIcd;
  String? kodeAsterikIcd;

  AsterikIcd10({this.icd10, this.namaIcd, this.kodeAsterikIcd});

  AsterikIcd10.fromJson(Map<String, dynamic> json) {
    icd10 = json['icd_10'];
    namaIcd = json['nama_icd'];
    kodeAsterikIcd = json['kode_asterik_icd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icd_10'] = icd10;
    data['nama_icd'] = namaIcd;
    data['kode_asterik_icd'] = kodeAsterikIcd;
    return data;
  }
}
