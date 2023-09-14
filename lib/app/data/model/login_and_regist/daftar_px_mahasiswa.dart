class DaftarPxMahasiswa {
  int? code;
  String? msg;
  Mahasiswa? mahasiswa;

  DaftarPxMahasiswa({this.code, this.mahasiswa, this.msg});

  DaftarPxMahasiswa.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    mahasiswa = json['mahasiswa'] != null
        ? Mahasiswa.fromJson(json['mahasiswa'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (mahasiswa != null) {
      data['mahasiswa'] = mahasiswa!.toJson();
    }
    return data;
  }
}

class Mahasiswa {
  int? noInduk;
  int? kode;
  String? noIndukMahasiswa;
  String? email;
  String? password;
  String? nama;
  int? idMtKaryawan;

  Mahasiswa(
      {this.noInduk,
      this.kode,
      this.noIndukMahasiswa,
      this.email,
      this.password,
      this.nama,
      this.idMtKaryawan});

  Mahasiswa.fromJson(Map<String, dynamic> json) {
    noInduk = json['no_induk'];
    kode = json['kode'];
    noIndukMahasiswa = json['no_induk_mahasiswa'];
    email = json['email'];
    password = json['password'];
    nama = json['nama'];
    idMtKaryawan = json['id_mt_karyawan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_induk'] = noInduk;
    data['kode'] = kode;
    data['no_induk_mahasiswa'] = noIndukMahasiswa;
    data['email'] = email;
    data['password'] = password;
    data['nama'] = nama;
    data['id_mt_karyawan'] = idMtKaryawan;
    return data;
  }
}
