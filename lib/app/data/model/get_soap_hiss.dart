class GetSoapHiss {
  int? code;
  String? msg;
  Data? data;

  GetSoapHiss({this.code, this.msg, this.data});

  GetSoapHiss.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? no;
  String? iD;
  String? namaPenyakit;
  String? subyektif;
  String? objektif;
  String? analisis;
  String? catatan;
  String? differential;
  String? prognosis;
  String? komplikasi;
  String? penunjang;
  String? icdX;
  String? diagnosaIcdx;
  String? classIcdx;
  String? lamaRawatIcdx;
  String? kelompokIcdx;
  String? icd10Kelompok;

  Data(
      {this.no,
      this.iD,
      this.namaPenyakit,
      this.subyektif,
      this.objektif,
      this.analisis,
      this.catatan,
      this.differential,
      this.prognosis,
      this.komplikasi,
      this.penunjang,
      this.icdX,
      this.diagnosaIcdx,
      this.classIcdx,
      this.lamaRawatIcdx,
      this.kelompokIcdx,
      this.icd10Kelompok});

  Data.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    iD = json['ID'];
    namaPenyakit = json['Nama_Penyakit'];
    subyektif = json['subyektif'];
    objektif = json['objektif'];
    analisis = json['analisis'];
    catatan = json['catatan'];
    differential = json['Differential'];
    prognosis = json['Prognosis'];
    komplikasi = json['komplikasi'];
    penunjang = json['penunjang'];
    icdX = json['IcdX'];
    diagnosaIcdx = json['Diagnosa_Icdx'];
    classIcdx = json['Class_Icdx'];
    lamaRawatIcdx = json['Lama_Rawat_Icdx'];
    kelompokIcdx = json['kelompok_Icdx'];
    icd10Kelompok = json['icd10_kelompok'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no'] = no;
    data['ID'] = iD;
    data['Nama_Penyakit'] = namaPenyakit;
    data['subyektif'] = subyektif;
    data['objektif'] = objektif;
    data['analisis'] = analisis;
    data['catatan'] = catatan;
    data['Differential'] = differential;
    data['Prognosis'] = prognosis;
    data['komplikasi'] = komplikasi;
    data['penunjang'] = penunjang;
    data['IcdX'] = icdX;
    data['Diagnosa_Icdx'] = diagnosaIcdx;
    data['Class_Icdx'] = classIcdx;
    data['Lama_Rawat_Icdx'] = lamaRawatIcdx;
    data['kelompok_Icdx'] = kelompokIcdx;
    data['icd10_kelompok'] = icd10Kelompok;
    return data;
  }
}
