class GetJadwalDokter {
  int? code;
  String? msg;
  List<Jadwal>? jadwal;

  GetJadwalDokter({this.code, this.msg, this.jadwal});

  GetJadwalDokter.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['jadwal'] != null) {
      jadwal = <Jadwal>[];
      json['jadwal'].forEach((v) {
        jadwal!.add(Jadwal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (jadwal != null) {
      data['jadwal'] = jadwal!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Jadwal {
  int? no;
  int? id;
  int? kodeDokter;
  String? rangeHari;
  String? jamMulai;
  String? jamAkhir;
  int? waktu;

  Jadwal(
      {this.no,
      this.id,
      this.kodeDokter,
      this.rangeHari,
      this.jamMulai,
      this.jamAkhir,
      this.waktu});

  Jadwal.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    id = json['id'];
    kodeDokter = json['kode_dokter'];
    rangeHari = json['range_hari'];
    jamMulai = json['jam_mulai'];
    jamAkhir = json['jam_akhir'];
    waktu = json['waktu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no'] = no;
    data['id'] = id;
    data['kode_dokter'] = kodeDokter;
    data['range_hari'] = rangeHari;
    data['jam_mulai'] = jamMulai;
    data['jam_akhir'] = jamAkhir;
    data['waktu'] = waktu;
    return data;
  }
}
