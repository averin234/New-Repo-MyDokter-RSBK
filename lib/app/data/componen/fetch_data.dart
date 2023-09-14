import "dart:convert";
import "dart:io";
import "package:mydokter_rsbk/app/data/componen/data_regist_model.dart";
import "package:mydokter_rsbk/app/data/componen/publics.dart";
import "package:mydokter_rsbk/app/data/model/checkup.dart";
import "package:mydokter_rsbk/app/data/model/get_antrian_dokter.dart";
import "package:mydokter_rsbk/app/data/model/get_antrian_pasien.dart";
import "package:mydokter_rsbk/app/data/model/get_detail_mr.dart";
import "package:mydokter_rsbk/app/data/model/get_detail_pasien.dart";
import "package:mydokter_rsbk/app/data/model/get_jenis_obat.dart";
import "package:mydokter_rsbk/app/data/model/get_list_kasir.dart";
import "package:mydokter_rsbk/app/data/model/get_list_mr.dart";
import "package:mydokter_rsbk/app/data/model/get_pasien_by.dart";
import "package:mydokter_rsbk/app/data/model/get_soap_hiss.dart";
import "package:mydokter_rsbk/app/data/model/kelurahan.dart";
import "package:mydokter_rsbk/app/data/model/list_data.dart";
import "package:mydokter_rsbk/app/data/model/login_and_regist/akses_px.dart";
import "package:mydokter_rsbk/app/data/model/login_and_regist/token.dart";
import "package:mydokter_rsbk/app/routes/app_pages.dart";
import "package:dio/dio.dart";
import "package:get/get.dart";
import "package:http/http.dart" as http;
import "package:intl/intl.dart";
import "package:path_provider/path_provider.dart";
import "../model/get_detail_dokter.dart";
import "../model/get_nama_obat.dart";
import "../model/get_racikan.dart";
import "../model/jadwal_dokter.dart";
import "../model/login_and_regist/daftar_px_dokter.dart";
import "../model/login_and_regist/daftar_px_dosen.dart";
import "../model/login_and_regist/daftar_px_mahasiswa.dart";
import "../model/login_and_regist/poli.dart";
import "../model/login_and_regist/post_ubah_password.dart";
import "../model/post_pasien_baru.dart";
import "../model/profile_pasien/get_tunai.dart";
import "local_storage.dart";

class API {
  static const _url = "https://rsbk.sirs.co.id/";
  // static const _url = "https://adokter.d-medis.id/";
  // static const _url = "https://demo.a-dokter.id/";
  static const _baseUrl = "${_url}api/dokter";
  static const _getToken = "$_baseUrl/get-token.php";
  static const _getAksesPx = "$_baseUrl/px-akses.php";
  static const _postDaftarPxBaruDokter =
      "$_baseUrl/post-daftar-px-baru-dokter.php";
  static const _getPoli = "$_baseUrl/get-poli.php";
  static const _postDaftarPx = "$_baseUrl/post-antrian-pasien.php";
  static const _getSpesialisasi = "$_baseUrl/get-spesialisasi.php";
  static const _getBank = "$_baseUrl/get-bank.php";
  static const _getJenisKelamin = "$_baseUrl/get-jenis-kelamin.php";
  static const _getPekerjaan = "$_baseUrl/get-pekerjaan.php";
  static const _getKawin = "$_baseUrl/get-kawin.php";
  static const _getGolDarah = "$_baseUrl/get-gol-darah.php";
  static const _getAgama = "$_baseUrl/get-agama.php";
  static const _getNasabah = "$_baseUrl/get-nasabah.php";
  static const _getIcd10 = "$_baseUrl/get-icd10.php";
  static const _getTunai = "$_baseUrl/get-tunai-pasien.php";
  static const _postDaftarPxBaruDosen =
      "$_baseUrl/post-daftar-px-baru-dosen.php";
  static const _postDaftarPxBaruMahasiswa =
      "$_baseUrl/post-daftar-px-baru-mahasiswa.php";
  // baru di tambah kan
  static const _getAntrianPasien = "$_baseUrl/get-antrian-pasien.php";
  static const _getDetailDokter = "$_baseUrl/get-detail-dokter.php";
  static const _getJadwalDokter = "$_baseUrl/get-jadwal-dokter.php";
  static const _getRiwayatPraktek = "$_baseUrl/get-riwayat-praktek.php";
  static const _getKota = "$_baseUrl/get-kota.php";
  static const _deleteJadwalDokter = "$_baseUrl/delete-jadwal-dokter.php";
  static const _getEditDokter = "$_baseUrl/edit-dokter.php";
  static const _getNamaPenyakit = "$_baseUrl/get-nama-penyakit-hiss.php";
  static const _getHISS = "$_baseUrl/get-soap-hiss.php";
  // static const _getTindakan = "$_baseUrl/get-tindakan-px.php";
  // static const _getVitalSign = "$_baseUrl/get-vital-sign-px.php";
  static const _getProvinsi = "$_baseUrl/get-provinsi.php";
  static const _getKecamatan = "$_baseUrl/get-kecamatan.php";
  static const _getKelurahan = "$_baseUrl/get-kelurahan.php";
  static const _getJenisDokter = "$_baseUrl/get-jenis-dokter.php";
  static const _getKesadaranPasien = "$_baseUrl/get-kesadaran-pasien.php";
  static const _getkeadaanumum = "$_baseUrl/get-keadaan-umum.php";
  static const _getPasienbBy = "$_baseUrl/get-pasien-by.php";
  static const _getLupaPassword = "$_baseUrl/cek-lupa-password.php";
  // static const _getStatusDokter = "$_baseUrl/get-status-dokter.php";
  // penambahan lagi
  static const _getDaftarPrivy = "$_baseUrl/daftar_privyid_dr.php";
  static const _postJadwalDokter = "$_baseUrl/post-jadwal-dokter.php";
  static const _postPasienBaru = "$_baseUrl/post-pasien-baru.php";
  static const _postUbahPassword = "$_baseUrl/post-ubah-password.php";
  static const _getAntrianDokter = "$_baseUrl/get-antrian-dokter.php";
  static const _getListMR = "$_baseUrl/get-list-mr.php";
  static const _getListKasir = "$_baseUrl/get-list-kasir.php";
  static const _getDetailMR = "$_baseUrl/get-detail-mr.php";
  static const _cekJenisKelamin = "$_baseUrl/cek-jenis-kelamin.php";
  static const _getDetailPasien = "$_baseUrl/get-detail-pasien.php";
  static const _cetakResep = "$_baseUrl/cetak-resep.php";
  static const _cekDaftarPasien = "$_baseUrl/cek-daftar-pasien.php";
  static const _editVitalSign = "$_baseUrl/edit-vital-sign.php";
  static const _getResep = "$_baseUrl/get-resep.php";
  static const _getObatTindakan = "$_baseUrl/get-obat-tindakan.php";
  static const _getReferensi = "$_baseUrl/get-referensi.php";
  static const _getTindakan = "$_baseUrl/get-tindakan.php";
  static const _postTindakan = "$_baseUrl/post-tindakan.php";
  static const _postSoap = "$_baseUrl/post-soap.php";
  static const _postTunai = "$_baseUrl/post-tunai.php";
  static const _postKredit = "$_baseUrl/post-kredit.php";
  static const _postDebet = "$_baseUrl/post-debet.php";
  static const _postIcd10 = "$_baseUrl/post-icd10.php";
  static const _postResep = "$_baseUrl/post-resep.php";
  static const _postPulang = "$_baseUrl/post-pulang.php";

  static Future<Token> getToken() async {
    var response = await Dio().post(
      _getToken,
      data: {"KeyCode": "MeTiRs", "v": "1.0"},
    );
    final data = jsonDecode(response.data);
    final obj = Token.fromJson(data);
    await LocalStorages.setToken(obj);
    print(obj.toJson());
    return obj;
  }

  // Tambahan Baru
  static Future<dynamic> getStatusDokter() async {
    var token = Publics.controller.getToken.value;
    final data = {};
    var response = await Dio().post(
      _getDaftarPrivy,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final obj = response.data;
    print(obj.toJson());
    return obj;
  }

  static Future<GetPasienBy> getPasienBy({required String query}) async {
    var token = Publics.controller.getToken.value;
    final data = {"query": query};
    var response = await Dio().post(
      _getPasienbBy,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = GetPasienBy.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<ListData> getkeadaanUmum() async {
    var token = Publics.controller.getToken.value;
    final data = {};
    var response = await Dio().post(
      _getkeadaanumum,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = ListData.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<ListData> getAsterix({required String src_icd}) async {
    var token = Publics.controller.getToken.value;
    final data = {"ac": "get_asterix", "sd": src_icd};
    var response = await Dio().post(
      _getIcd10,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = ListData.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<ListData> getIcd10({required String src_icd}) async {
    var token = Publics.controller.getToken.value;
    final data = {"ac": "get_icd10", "sd": src_icd};
    var response = await Dio().post(
      _getIcd10,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = ListData.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<CheckUp> postIcd10({
    required String no_registrasi,
    required String icd_10,
    required String icd_asterik,
    required String kasus_pasien,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "nr": no_registrasi,
      "i10": icd_10,
      "iri": icd_asterik,
      "kp": kasus_pasien,
    };
    var response = await Dio().post(
      _postIcd10,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = CheckUp.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<GetTunai> getTunai({
    required String no_registrasi,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "nr": no_registrasi,
    };
    var response = await Dio().post(
      _getTunai,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = GetTunai.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<CheckUp> postPulang({
    required String no_registrasi,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "nr": no_registrasi,
    };
    var response = await Dio().post(
      _postPulang,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = CheckUp.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<CheckUp> postTunai({
    required String no_registrasi,
    required String pembayar,
    required String tagihan,
    required String tunai,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "nr": no_registrasi,
      "pembayar": pembayar,
      "tagihan": tagihan,
      "tunai": tunai,
    };
    var response = await Dio().post(
      _postTunai,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = CheckUp.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<CheckUp> postDebet({
    required String no_registrasi,
    required String pembayar,
    required String tagihan,
    required String bank,
    required String jumlah,
    required String batch,
    required String kartu,
    required String pembulatan,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "nr": no_registrasi,
      "pembayar": pembayar,
      "tagihan": tagihan,
      "bankDebet": bank,
      "jumlahDebet": jumlah,
      "noBatchDebet": batch,
      "noKartuDebet": kartu,
      "pembulatan": pembulatan,
    };
    var response = await Dio().post(
      _postDebet,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = CheckUp.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<CheckUp> postKredit({
    required String no_registrasi,
    required String pembayar,
    required String tagihan,
    required String bank,
    required String jumlah,
    required String batch,
    required String kartu,
    required String pembulatan,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "nr": no_registrasi,
      "pembayar": pembayar,
      "tagihan": tagihan,
      "bankKredit": bank,
      "jumlahKredit": jumlah,
      "noBatchKredit": batch,
      "noKartuKredit": kartu,
      "pembulatan": pembulatan,
    };
    var response = await Dio().post(
      _postKredit,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = CheckUp.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<CheckUp> postResep({
    required String no_registrasi,
    required String id_dc_kesediaan_obat,
    required String kode_brg,
    required String kode_brg_racikan,
    required String id_dd_dosis,
    required String txt_jumlah,
    required String id_stok,
    required String flag_dosis,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "nr": no_registrasi,
      "ko": id_dc_kesediaan_obat,
      "kb": kode_brg,
      "kbc": kode_brg_racikan,
      "dos": id_dd_dosis,
      "tj": txt_jumlah,
      "st": id_stok,
      "fd": flag_dosis,
    };
    var response = await Dio().post(
      _postResep,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = CheckUp.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<ListData> getAturanPakai({required String kesediaan}) async {
    var token = Publics.controller.getToken.value;
    final data = {"ac": "get_aturan_pakai", "id_kesediaan_obat": kesediaan};
    var response = await Dio().post(
      _getResep,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = ListData.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<CheckUp> postDaftarPx({
    required String kode_dokter,
    required String jam_awal,
    required String no_mr,
    required String durasi,
    required String nasabah,
    required String no_polis,
    required String no_antrian,
    required String no_bpjs,
    required String yankes,
    required String jadwal,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "kd": kode_dokter,
      "jw": jam_awal,
      "no_antrian": no_antrian,
      "nm": no_mr,
      "durasi": durasi,
      "nasabah": nasabah,
      "no_polis": no_polis,
      "no_bpjs": no_bpjs,
      "yankes": yankes,
      "jadwal": jadwal,
    };
    var response = await Dio().post(
      _postDaftarPx,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = CheckUp.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<CheckUp> postTindakan({
    required String no_registrasi,
    required String kode_tarif,
    required String jumlah_tindakan,
    required String kode_brg,
    required String jumlah_obat,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "nr": no_registrasi,
      "kode_tarif": kode_tarif,
      "jumlah_tindakan": jumlah_tindakan,
      "kb": kode_brg,
      "jumlah_obat": jumlah_obat,
    };
    var response = await Dio().post(
      _postTindakan,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = CheckUp.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<CheckUp> postSoap({
    required String no_registrasi,
    required String subjective,
    required String analyst,
    required String objective,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "nr": no_registrasi,
      "subjective": subjective,
      "objective": objective,
      "analyst": analyst,
    };
    var response = await Dio().post(
      _postSoap,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = CheckUp.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<ListData> getAgama() async {
    var token = Publics.controller.getToken.value;
    final data = {};
    var response = await Dio().post(
      _getAgama,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = ListData.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<ListData> getNasabah() async {
    var token = Publics.controller.getToken.value;
    final data = {};
    var response = await Dio().post(
      _getNasabah,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = ListData.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<ListData> getPekerjaan() async {
    var token = Publics.controller.getToken.value;
    final data = {};
    var response = await Dio().post(
      _getPekerjaan,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = ListData.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<ListData> getKawin() async {
    var token = Publics.controller.getToken.value;
    final data = {};
    var response = await Dio().post(
      _getKawin,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = ListData.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<ListData> getKesadaranPasien() async {
    var token = Publics.controller.getToken.value;
    final data = {};
    var response = await Dio().post(
      _getKesadaranPasien,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = ListData.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<ListData> getGolonganDarah() async {
    var token = Publics.controller.getToken.value;
    final data = {};
    var response = await Dio().post(
      _getGolDarah,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = ListData.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<ListData> getJenisDokter() async {
    var token = Publics.controller.getToken.value;
    final data = {};
    var response = await Dio().post(
      _getJenisDokter,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = ListData.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<ListData> getJenisKelamin() async {
    var token = Publics.controller.getToken.value;
    final data = {};
    var response = await Dio().post(
      _getJenisKelamin,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = ListData.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<GetListKasir> getListKasir(
      {required String kode_dokter}) async {
    var token = Publics.controller.getToken.value;
    final data = {"kd": kode_dokter};
    var response = await Dio().post(
      _getListKasir,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = GetListKasir.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<ListData> getProvinsi() async {
    var token = Publics.controller.getToken.value;
    final data = {};
    var response = await Dio().post(
      _getProvinsi,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = ListData.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<ListData> getKecamatan({required String id}) async {
    var token = Publics.controller.getToken.value;
    final data = {"kt": id};
    var response = await Dio().post(
      _getKecamatan,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = ListData.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<GetKelurahan> getKelurahan({required String id}) async {
    var token = Publics.controller.getToken.value;
    final data = {"kec": id};
    var response = await Dio().post(
      _getKelurahan,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = GetKelurahan.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<dynamic> getDaftarPrivy({
    required String kode_dokter,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "kd": kode_dokter,
    };
    var response = await Dio().post(
      _getDaftarPrivy,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final obj = response.data;
    print(obj.toJson());
    return obj;
  }

  static Future<CheckUp> postJadwalDokter({
    required String id_jadwal_dokter,
    required String kode_dokter,
    required String senin,
    required String selasa,
    required String rabu,
    required String kamis,
    required String jumat,
    required String sabtu,
    required String minggu,
    required String jam_awal,
    required String jam_akhir,
    required String waktu_periksa,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "jd": id_jadwal_dokter,
      "kd": kode_dokter,
      "senin": senin,
      "selasa": selasa,
      "rabu": rabu,
      "kamis": kamis,
      "jumat": jumat,
      "sabtu": sabtu,
      "minggu": minggu,
      "jw": jam_awal,
      "jh": jam_akhir,
      "wp": waktu_periksa,
    };
    var response = await Dio().post(
      _postJadwalDokter,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = CheckUp.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<PostPasienBaru> postPasienBaru({
    required String kode_dokter,
    required String nama_pasien,
    required String nasabah,
    required String id_agama,
    required String nama_keluarga,
    required String no_hp,
    required String no_ktp,
    required String id_kerja,
    required String tempat_lahir,
    required String email,
    required String tgl_lahir,
    required String jenis_kelamin,
    required String alamat,
    required String id_kawin,
    required String id_prov,
    required String id_goldar,
    required String id_kota,
    required String id_kecamatan,
    required String alergi,
    required String kode_pos,
    required String id_kelurahan,
    required String foto_pasien,
    required String no_bpjs,
    required String no_polis,
    required String id_yankes,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "kd": kode_dokter,
      "np": nama_pasien,
      "nasabah": nasabah,
      "id_agama": id_agama,
      "nama_keluarga": nama_keluarga,
      "nh": no_hp,
      "nt": no_ktp,
      "id_kerja": id_kerja,
      "tempat_lahir": tempat_lahir,
      "em": email,
      "tgl_lahir": tgl_lahir,
      "jk": jenis_kelamin,
      "al": alamat,
      "id_kawin": id_kawin,
      "id_prov": id_prov,
      "id_goldar": id_goldar,
      "kt": id_kota,
      "kec": id_kecamatan,
      "alergi": alergi,
      "kode_pos": kode_pos,
      "kel": id_kelurahan,
      "foto_pasien": foto_pasien,
      "no_bpjs": no_bpjs,
      "no_polis": no_polis,
      "id_yankes": id_yankes,
    };
    var response = await Dio().post(
      _postPasienBaru,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = PostPasienBaru.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<PostUbahPassword> postUbahPassword({
    required String email,
    required String pw_baru,
    required String pw_lama,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "em": email,
      "pb": pw_baru,
      "pl": pw_lama,
    };
    var response = await Dio().post(
      _postUbahPassword,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = PostUbahPassword.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      LocalStorages.setDataRegist(
          DataRegist(email: obj.res!.username, password: obj.res!.password));
    }
    print(obj.toJson());
    return obj;
  }

  static Future<GetDetailMR> getDetailMR({
    required String no_registrasi,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "nr": no_registrasi,
      "url": _url,
    };
    var response = await Dio().post(
      _getDetailMR,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = GetDetailMR.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(no_registrasi);
    print(obj.toJson());
    return obj;
  }

  static Future<GetAntrianDokter> getAntrianDokter({
    required String kode_dokter,
    required String tgl_daftar,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "kd": kode_dokter,
      "td": tgl_daftar,
      "tgl_skrng": DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now())
    };
    var response = await Dio().post(
      _getAntrianDokter,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = GetAntrianDokter.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<GetListMR> getListMR({
    required String kode_dokter,
    required String no_mr,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "kd": kode_dokter,
      "nm": no_mr,
    };
    var response = await Dio().post(
      _getListMR,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = GetListMR.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<CheckUp> cekJenisKelamin({
    required String jenis_kelamin,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "jk": jenis_kelamin,
    };
    var response = await Dio().post(
      _cekJenisKelamin,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = CheckUp.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<CheckUp> CekLupaPassword({
    required String email,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "em": email,
    };
    var response = await Dio().post(
      _getLupaPassword,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = CheckUp.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<GetDetailPasien> getDetailPasien({
    required String no_mr,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "nm": no_mr,
      "url": _url,
    };
    var response = await Dio().post(
      _getDetailPasien,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = GetDetailPasien.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<String> cetakResep({
    required String no_registrasi,
  }) async {
    var token = await getToken();
    final data = {
      "nr": no_registrasi,
    };
    var response = await http.post(
      Uri.parse(_cetakResep),
      headers: {
        "X-Api-Token": token.token ?? "",
      },
      body: data,
    );
    var dir = await getApplicationDocumentsDirectory();
    File file = File("${dir.path}resep.pdf");
    await file.writeAsBytes(response.bodyBytes, flush: true);
    final obj = file.path;
    return obj;
  }

  static Future<CheckUp> cekDaftarPasien({
    required String no_mr,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "nm": no_mr,
    };
    var response = await Dio().post(
      _cekDaftarPasien,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = CheckUp.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<CheckUp> postVitalSign({
    required String no_registrasi,
    required String keadaan_umum,
    required String kesadaran_pasien,
    required String tekanan_darah,
    required String nadi,
    required String suhu,
    required String pernapasan,
    required String tinggi_badan,
    required String berat_badan,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "nr": no_registrasi,
      "keadaan_umum": keadaan_umum,
      "kesadaran_pasien": kesadaran_pasien,
      "tekanan_darah": tekanan_darah,
      "nadi": nadi,
      "suhu": suhu,
      "pernafasan": pernapasan,
      "tinggi_badan": tinggi_badan,
      "berat_badan": berat_badan,
    };
    var response = await Dio().post(
      _editVitalSign,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = CheckUp.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<GetNamaObat> getNamaObat({
    required String src_obat,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "ac": "get_nama_obat",
      "src_obat": src_obat,
    };
    var response = await Dio().post(
      _getResep,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = GetNamaObat.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<GetJenisObat> getJenisObat() async {
    var token = Publics.controller.getToken.value;
    final data = {
      "ac": "get_jenis_obat",
    };
    var response = await Dio().post(
      _getResep,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = GetJenisObat.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<GetRacikan> getRacikan({
    required String src_racikan,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "ac": "get_racikan",
      "src_racikan": src_racikan,
    };
    var response = await Dio().post(
      _getResep,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = GetRacikan.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<ListData> getObatTindakan({
    required String kode_dokter,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "kd": kode_dokter,
    };
    var response = await Dio().post(
      _getObatTindakan,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = ListData.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<ListData> getReferensi() async {
    var token = await getToken();
    final data = {};
    var response = await Dio().post(
      _getReferensi,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = ListData.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  // Batas Tambahan Baru

  static Future<ListData> getTindakan({
    required String kode_dokter,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {"kd": kode_dokter};
    var response = await Dio().post(
      _getTindakan,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = ListData.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<ListData> getSpesialisasi({
    required String id,
  }) async {
    var token = await getToken();
    final data = {"id": id};
    var response = await Dio().post(
      _getSpesialisasi,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = ListData.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<ListData> getBank() async {
    var token = await getToken();
    final data = {};
    var response = await Dio().post(
      _getBank,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = ListData.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<GetSoapHiss> getHISS({
    required String id,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {"id": id};
    var response = await Dio().post(
      _getHISS,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = GetSoapHiss.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<ListData> getNamaPenyakit({
    required String src_penyakit,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {"src_penyakit": src_penyakit};
    var response = await Dio().post(
      _getNamaPenyakit,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = ListData.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<CheckUp> getEditDokter({
    required String kode_dokter,
    required String nama,
    required String nik,
    required String tgl_lhr,
    required String id_spesialisasi,
    required String id_status_dokter,
    required String kode_bagian,
    required String sip,
    required String provinsi,
    required String kota,
    required String telp,
    required String email,
    required String alamat,
    required String foto_ktp,
    required String foto_dokter,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "kd": kode_dokter,
      "nama": nama,
      "nik": nik,
      "tgl_lhr": tgl_lhr,
      "id_spesialisasi": id_spesialisasi,
      "id_status_dokter": id_status_dokter,
      "kode_bagian": kode_bagian,
      "sip": sip,
      "provinsi": provinsi,
      "kota": kota,
      "telp": telp,
      "em": email,
      "al": alamat,
      "foto_ktp": foto_ktp,
      "foto_dokter": foto_dokter,
    };
    var response = await Dio().post(
      _getEditDokter,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = CheckUp.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<CheckUp> deleteJadwalDokter({
    required String id,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {"id": id};
    var response = await Dio().post(
      _deleteJadwalDokter,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = CheckUp.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<ListData> getKota({
    required String id_prov,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {"id_provinsi": id_prov};
    var response = await Dio().post(
      _getKota,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = ListData.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<dynamic> getRiwayatPraktek({
    required String kode_dokter,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {"kd": kode_dokter};
    var response = await Dio().post(
      _getRiwayatPraktek,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<GetJadwalDokter> getJadwalDokter({
    required String kode_dokter,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {"kd": kode_dokter};
    var response = await Dio().post(
      _getJadwalDokter,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = GetJadwalDokter.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<GetDetailDokter> getDetailDokter({
    required String kode_dokter,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {"kd": kode_dokter, "url": _url};
    var response = await Dio().post(
      _getDetailDokter,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = GetDetailDokter.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<GetAntrianPasien> getAntrianPasien({
    required String tanggal,
    required String kode_dokter,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "tg": tanggal,
      "kd": kode_dokter,
    };
    var response = await Dio().post(
      _getAntrianPasien,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = GetAntrianPasien.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<AksesPx> getAksesPx(
      {required String user, required String pass, bool? ingetSaya}) async {
    var token = await getToken();
    final data = {"us": user, "pw": pass};
    var response = await Dio().post(
      _getAksesPx,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      if (obj.code != 200) {
        Get.back();
        Get.snackbar(
          obj.code.toString(),
          obj.msg.toString(),
        );
      } else {
        await LocalStorages.setDataRegist(DataRegist(
          email: user,
          password: pass,
          kode: obj.res!.kode,
          ingatSaya: ingetSaya ?? false,
        ));
      }
    }
    print(obj.toJson());
    print(obj.toJson());
    return obj;
  }

  static Future<DaftarPxDokter> postDaftarPxBaruDokter(
      {required String nama,
      required String email,
      required String noHp,
      required String sip,
      required String referensi,
      required String kodeBagian}) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "nama": nama,
      "nh": noHp,
      "em": email,
      "sip": sip,
      "kode_bagian": kodeBagian,
      "referensi": referensi,
    };
    var response = await Dio().post(
      _postDaftarPxBaruDokter,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final json = jsonDecode(response.data);
    final obj = DaftarPxDokter.fromJson(json);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      if (obj.code != 200) {
        Get.snackbar(
          obj.code.toString(),
          obj.msg.toString(),
        );
      }
    }
    print(obj.toJson());
    return obj;
  }

  static Future<DaftarPxDosen> postDaftarPxBaruDosen(
      {required String nama,
      required String email,
      required String noHp,
      required String universitas,
      required String fakultas,
      required String noInduk}) async {
    var token = await getToken();
    final data = {
      "np": nama,
      "em": email,
      "nh": noHp,
      "universitas": universitas,
      "fakultas": fakultas,
      "no_induk": noInduk,
    };
    var response = await Dio().post(
      _postDaftarPxBaruDosen,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final json = jsonDecode(response.data);
    final obj = DaftarPxDosen.fromJson(json);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      if (obj.code != 200) {
        Get.snackbar(
          obj.code.toString(),
          obj.msg.toString(),
        );
      }
    }
    print(obj.toJson());
    return obj;
  }

  static Future<DaftarPxMahasiswa> postDaftarPxBaruMahasiswa(
      {required String nama,
      required String email,
      required String noHp,
      required String universitas,
      required String noInduk,
      required String jenjang,
      required String tahunMasuk,
      required String semester,
      required String fakultas}) async {
    var token = await getToken();
    final data = {
      "nama": nama,
      "em": email,
      "nh": noHp,
      "universitas": universitas,
      "no_induk_mahasiswa": noInduk,
      "jenjang_pendidikan": jenjang,
      "fakultas": fakultas,
      "tahun_masuk": tahunMasuk,
      "semester": semester
    };
    var response = await Dio().post(
      _postDaftarPxBaruMahasiswa,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final json = jsonDecode(response.data);
    final obj = DaftarPxMahasiswa.fromJson(json);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      if (obj.code != 200) {
        Get.snackbar(
          obj.code.toString(),
          obj.msg.toString(),
        );
      } else {
        await LocalStorages.setDataRegist(DataRegist(
            email: obj.mahasiswa!.email, password: obj.mahasiswa!.password));
      }
    }
    print(obj.toJson());
    return obj;
  }

  static Future<Poli> getPoli() async {
    var token = Publics.controller.getToken.value;
    var data = {};
    var response = await Dio().post(
      _getPoli,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token ?? "",
        },
      ),
      data: data,
    );
    final obj = Poli.fromJson(jsonDecode(response.data));
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(obj.code.toString(), obj.msg.toString());
    }
    print(obj.toJson());
    return obj;
  }
}
