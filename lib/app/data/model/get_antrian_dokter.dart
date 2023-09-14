class GetAntrianDokter {
  List<ListAntrian>? list;
  int? code;
  String? msg;

  GetAntrianDokter({this.list, this.code, this.msg});

  GetAntrianDokter.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <ListAntrian>[];
      json['list'].forEach((v) {
        list!.add(ListAntrian.fromJson(v));
      });
    }
    code = json['code'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    data['code'] = code;
    data['msg'] = msg;
    return data;
  }
}

class ListAntrian {
  int? antrian;
  String? durasi;
  String? jam;

  ListAntrian({this.antrian, this.durasi, this.jam});

  ListAntrian.fromJson(Map<String, dynamic> json) {
    antrian = json['antrian'];
    durasi = json['durasi'];
    jam = json['jam'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['antrian'] = antrian;
    data['durasi'] = durasi;
    data['jam'] = jam;
    return data;
  }
}
