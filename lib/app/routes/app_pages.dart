import 'package:mydokter_rsbk/app/data/model/get_list_kasir.dart';
import 'package:mydokter_rsbk/app/modules/bottomsheet/bottomsheet_bayar_kasir.dart';
import 'package:get/get.dart';

import '../modules/Jadwal_Dokter/bindings/jadwal_dokter_binding.dart';
import '../modules/Jadwal_Dokter/views/jadwal_dokter_view.dart';
import '../modules/antrian_pasien/bindings/antrian_pasien_binding.dart';
import '../modules/antrian_pasien/views/antrian_pasien_view.dart';
import '../modules/cetakan/bindings/cetakan_binding.dart';
import '../modules/cetakan/views/cetakan_view.dart';
import '../modules/cv/bindings/cv_binding.dart';
import '../modules/cv/views/cv_view.dart';
import '../modules/detail_antrian/bindings/detail_tindakan_binding.dart';
import '../modules/detail_antrian/views/detail_tindakan_view.dart';
import '../modules/detail_regist_pasien_lama/bindings/detail_regist_pasien_lama_binding.dart';
import '../modules/detail_regist_pasien_lama/views/detail_regist_pasien_lama_view.dart';
import '../modules/detail_riwayat/bindings/detail_riwayat_binding.dart';
import '../modules/detail_riwayat/views/detail_riwayat_view.dart';
import '../modules/dosen/bindings/dosen_binding.dart';
import '../modules/dosen/views/dosen_view.dart';
import '../modules/hiss/bindings/hiss_binding.dart';
import '../modules/hiss/views/hiss_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/isi_icd_10/bindings/isi_icd_10_binding.dart';
import '../modules/isi_icd_10/views/isi_icd_10_view.dart';
import '../modules/isi_resep/bindings/isi_resep_binding.dart';
import '../modules/isi_resep/views/isi_resep_view.dart';
import '../modules/isi_tindakan/bindings/isi_tindakan_binding.dart';
import '../modules/isi_tindakan/views/isi_tindakan_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/mahasiswa/bindings/mahasiswa_binding.dart';
import '../modules/mahasiswa/views/mahasiswa_view.dart';
import '../modules/medical_record/bindings/tindakan_binding.dart';
import '../modules/medical_record/views/tindakan_view.dart';
import '../modules/pembayaran_kartu_debet/bindings/pembayaran_kartu_debet_binding.dart';
import '../modules/pembayaran_kartu_debet/views/pembayaran_kartu_debet_view.dart';
import '../modules/pembayaran_tunai/bindings/pembayaran_tunai_binding.dart';
import '../modules/pembayaran_tunai/views/pembayaran_tunai_view.dart';
import '../modules/pemeriksaan/bindings/pemeriksaan_binding.dart';
import '../modules/pemeriksaan/views/pemeriksaan_view.dart';
import '../modules/pendapatan_dokter/bindings/pendapatan_dokter_binding.dart';
import '../modules/pendapatan_dokter/views/pendapatan_dokter_view.dart';
import '../modules/penunjang_medis/bindings/penunjang_medis_binding.dart';
import '../modules/penunjang_medis/views/penunjang_medis_view.dart';
import '../modules/perjanjian_dokter/bindings/perjanjian_dokter_binding.dart';
import '../modules/perjanjian_dokter/views/perjanjian_dokter_view.dart';
import '../modules/privyid/bindings/privyid_binding.dart';
import '../modules/privyid/views/privyid_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/regist_pasien_lama/bindings/tambah_pasien_lama_binding.dart';
import '../modules/regist_pasien_lama/views/tambah_pasien_lama_view.dart';
import '../modules/register_dokter/bindings/register_dokter_binding.dart';
import '../modules/register_dokter/views/register_dokter_view.dart';
import '../modules/register_dosen/bindings/register_dosen_binding.dart';
import '../modules/register_dosen/views/register_dosen_view.dart';
import '../modules/register_mahasiswa/bindings/register_mahasiswa_binding.dart';
import '../modules/register_mahasiswa/views/register_mahasiswa_view.dart';
import '../modules/registrasi_pasien/bindings/registrasi_pasien_binding.dart';
import '../modules/registrasi_pasien/views/registrasi_pasien_view.dart';
import '../modules/riwayat_jabatan/bindings/riwayat_jabatan_binding.dart';
import '../modules/riwayat_jabatan/views/riwayat_jabatan_view.dart';
import '../modules/riwayat_keluarga/bindings/riwayat_keluarga_binding.dart';
import '../modules/riwayat_keluarga/views/riwayat_keluarga_view.dart';
import '../modules/riwayat_medical_record/bindings/riwayat_medical_record_binding.dart';
import '../modules/riwayat_medical_record/views/riwayat_medical_record_view.dart';
import '../modules/riwayat_pendidikan/bindings/riwayat_pendidikan_binding.dart';
import '../modules/riwayat_pendidikan/views/riwayat_pendidikan_view.dart';
import '../modules/riwayat_praktek/bindings/riwayat_praktek_binding.dart';
import '../modules/riwayat_praktek/views/riwayat_praktek_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';
import '../modules/verifikasi_akun/bindings/verifikasi_akun_binding.dart';
import '../modules/verifikasi_akun/views/verifikasi_akun_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_DOKTER,
      page: () => const RegisterDokterView(),
      binding: RegisterDokterBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_DOSEN,
      page: () => const RegisterDosenView(),
      binding: RegisterDosenBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_MAHASISWA,
      page: () => const RegisterMahasiswaView(),
      binding: RegisterMahasiswaBinding(),
    ),
    GetPage(
      name: _Paths.ANTRIAN_PASIEN,
      page: () => const AntrianPasienView(),
      binding: AntrianPasienBinding(),
    ),
    GetPage(
      name: _Paths.HISS,
      page: () => HissView(),
      binding: HissBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_TINDAKAN,
      page: () => const DetailTindakanView(),
      binding: DetailTindakanBinding(),
    ),
    GetPage(
      name: _Paths.RIWAYAT_MEDICAL_RECORD,
      page: () => const RiwayatMedicalRecordView(),
      binding: RiwayatMedicalRecordBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_RIWAYAT,
      page: () => const DetailRiwayatView(),
      binding: DetailRiwayatBinding(),
    ),
    GetPage(
      name: _Paths.PENUNJANG_MEDIS,
      page: () => const PenunjangMedisView(),
      binding: PenunjangMedisBinding(),
    ),
    GetPage(
      name: _Paths.TINDAKAN,
      page: () => const TindakanView(),
      binding: TindakanBinding(),
    ),
    GetPage(
      name: _Paths.ISI_RESEP,
      page: () => const IsiResepView(),
      binding: IsiResepBinding(),
    ),
    GetPage(
      name: _Paths.ISI_ICD_10,
      page: () => const IsiIcd10View(),
      binding: IsiIcd10Binding(),
    ),
    GetPage(
      name: _Paths.PEMERIKSAAN,
      page: () => const PemeriksaanView(),
      binding: PemeriksaanBinding(),
    ),
    GetPage(
      name: _Paths.PENDAPATAN_DOKTER,
      page: () => const PendapatanDokterView(),
      binding: PendapatanDokterBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ISI_TINDAKAN,
      page: () => const IsiTindakanView(),
      binding: IsiTindakanBinding(),
    ),
    GetPage(
      name: _Paths.JADWAL_DOKTER,
      page: () => JadwalDokterView(),
      binding: JadwalDokterBinding(),
    ),
    GetPage(
      name: _Paths.RIWAYAT_PRAKTEK,
      page: () => RiwayatPraktekView(),
      binding: RiwayatPraktekBinding(),
    ),
    GetPage(
      name: _Paths.RIWAYAT_PENDIDIKAN,
      page: () => const RiwayatPendidikanView(),
      binding: RiwayatPendidikanBinding(),
    ),
    GetPage(
      name: _Paths.RIWAYAT_JABATAN,
      page: () => const RiwayatJabatanView(),
      binding: RiwayatJabatanBinding(),
    ),
    GetPage(
      name: _Paths.RIWAYAT_KELUARGA,
      page: () => const RiwayatKeluargaView(),
      binding: RiwayatKeluargaBinding(),
    ),
    GetPage(
      name: _Paths.CV,
      page: () => const CvView(),
      binding: CvBinding(),
    ),
    GetPage(
      name: _Paths.PERJANJIAN_DOKTER,
      page: () => const PerjanjianDokterView(),
      binding: PerjanjianDokterBinding(),
    ),
    GetPage(
      name: _Paths.PRIVYID,
      page: () => const PrivyidView(),
      binding: PrivyidBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.MAHASISWA,
      page: () => const MahasiswaView(),
      binding: MahasiswaBinding(),
    ),
    GetPage(
      name: _Paths.DOSEN,
      page: () => const DosenView(),
      binding: DosenBinding(),
    ),
    GetPage(
      name: _Paths.CETAKAN,
      page: () => CetakanView(),
      binding: CetakanBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRASI_PASIEN,
      page: () => const RegistrasiPasienView(),
      binding: RegistrasiPasienBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_PASIEN_LAMA,
      page: () => const TambahPasienLamaView(),
      binding: TambahPasienLamaBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_REGIST_PASIEN_LAMA,
      page: () => DetailRegistPasienLamaView(),
      binding: DetailRegistPasienLamaBinding(),
    ),
    GetPage(
      name: _Paths.VERIFIKASI_AKUN,
      page: () => const VerifikasiAkunView(),
      binding: VerifikasiAkunBinding(),
    ),
    GetPage(
      name: _Paths.PEMBAYARAN_TUNAI,
      page: () => const PembayaranTunaiView(),
      binding: PembayaranTunaiBinding(),
    ),
    GetPage(
      name: _Paths.PEMBAYARAN_KARTU_DEBET,
      page: () => PembayaranKartuDebetView(),
      binding: PembayaranKartuDebetBinding(),
    ),
  ];
}
