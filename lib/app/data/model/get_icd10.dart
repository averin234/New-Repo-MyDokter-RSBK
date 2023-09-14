class GetIcd10 {
  int? code;
  String? msg;
  List<NamaIcd10>? namaIcd10;

  GetIcd10({this.code, this.msg, this.namaIcd10});

  GetIcd10.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['nama_icd10'] != null) {
      namaIcd10 = <NamaIcd10>[];
      json['nama_icd10'].forEach((v) {
        namaIcd10!.add(NamaIcd10.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (namaIcd10 != null) {
      data['nama_icd10'] = namaIcd10!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NamaIcd10 {
  String? icd10;
  String? namaIcd;

  NamaIcd10({this.icd10, this.namaIcd});

  NamaIcd10.fromJson(Map<String, dynamic> json) {
    icd10 = json['icd_10'];
    namaIcd = json['nama_icd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icd_10'] = icd10;
    data['nama_icd'] = namaIcd;
    return data;
  }
}
