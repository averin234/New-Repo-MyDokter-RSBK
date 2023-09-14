class GetRacikan {
  int? code;
  String? msg;
  List<ListRacikan>? listRacikan;

  GetRacikan({this.code, this.listRacikan, this.msg});

  GetRacikan.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['list_racikan'] != null) {
      listRacikan = <ListRacikan>[];
      json['list_racikan'].forEach((v) {
        listRacikan!.add(ListRacikan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (listRacikan != null) {
      data['list_racikan'] = listRacikan!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListRacikan {
  String? idRacikan;
  String? namaRacikan;
  String? kodeObat;
  String? jumlahObat;

  ListRacikan(
      {this.idRacikan, this.namaRacikan, this.kodeObat, this.jumlahObat});

  ListRacikan.fromJson(Map<String, dynamic> json) {
    idRacikan = json['id_racikan'];
    namaRacikan = json['nama_racikan'];
    kodeObat = json['kode_obat'];
    jumlahObat = json['jumlah_obat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_racikan'] = idRacikan;
    data['nama_racikan'] = namaRacikan;
    data['kode_obat'] = kodeObat;
    data['jumlah_obat'] = jumlahObat;
    return data;
  }
}
