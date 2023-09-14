class ListData {
  int? code;
  String? msg;
  List<Lists>? list;

  ListData({this.code, this.list, this.msg});

  ListData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['list'] != null) {
      list = <Lists>[];
      json['list'].forEach((v) {
        list!.add(Lists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lists {
  String? kode;
  String? nama;

  Lists({this.kode, this.nama});

  Lists.fromJson(Map<String, dynamic> json) {
    kode = json['kode'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kode'] = kode;
    data['nama'] = nama;
    return data;
  }
}
