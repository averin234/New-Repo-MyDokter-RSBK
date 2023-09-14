class NomorSurat {
  int? code;
  String? nomorSuratSakit;
  String? nomorSuratSehat;

  NomorSurat({this.code, this.nomorSuratSakit, this.nomorSuratSehat});

  NomorSurat.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    nomorSuratSakit = json['nomor_surat_sakit'];
    nomorSuratSehat = json['nomor_surat_sehat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['nomor_surat_sakit'] = nomorSuratSakit;
    data['nomor_surat_sehat'] = nomorSuratSehat;
    return data;
  }
}
