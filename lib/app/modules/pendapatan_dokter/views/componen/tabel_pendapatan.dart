import 'package:mydokter_rsbk/app/data/model/get_list_kasir.dart';
import 'package:mydokter_rsbk/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pendapatan extends StatelessWidget {
  final Kasir kasir;
  Pendapatan({
    super.key,
    required this.kasir,
  });
  TextEditingController Pembulatan = TextEditingController(text: '0,00');

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Get.toNamed(Routes.DETAIL_TINDAKAN),
      child: Container(
        margin: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
        padding: const EdgeInsets.only(right: 0, left: 10, bottom: 10, top: 10),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0x6cc7d1db)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFe0e0e0).withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(2, 1),
            ),
          ],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: InkWell(
                  onTap: () async {
                    showModalBottomSheet(
                      showDragHandle: true,
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (context) =>
                          Pilihpembayaran(kasir.noRegistrasi ?? ''),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Selesai Periksa',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold)),
                      Container(
                        padding: const EdgeInsets.only(
                            right: 5, left: 5, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue,
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.monetization_on_rounded,
                                color: Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Cek Pembayaran Pasien',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text('No Registrasi ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(': ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(kasir.noRegistrasi ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Text('Tanggal Masuk ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(': '),
                  Text(kasir.jamMasuk ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Text('Nama Pasien '),
                  const Text(': '),
                  Text(kasir.namaPasien ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text('Nasabah '),
                  const Text(': '),
                  Text(kasir.namaKelompok ?? ''),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text('Nama Bagian '),
                  const Text(': '),
                  Text(kasir.namaBagian ?? ''),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(color: Colors.black),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              "Billing",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Get.toNamed(Routes.ANTRIAN_PASIEN);
                            },
                            child: Text(
                              "Rp ${kasir.billing}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget Pilihpembayaran(String nr) {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.transparent,
      ),
      child: Column(children: [
        const Text(
          'Pilih metode pembayaran',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            Get.back();
            Get.toNamed(Routes.PEMBAYARAN_TUNAI,
                parameters: {'nr': kasir.noRegistrasi ?? ''}, arguments: kasir);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 10, left: 10),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0x6cc7d1db)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/rp.png',
                    height: 40,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text('Bayar Tunai',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ]),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            Get.back();
            Get.toNamed(Routes.PEMBAYARAN_KARTU_DEBET,
                parameters: {'nr': kasir.noRegistrasi ?? ''}, arguments: kasir);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 10, left: 10),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0x6cc7d1db)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/atm.png',
                    height: 40,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text('Kartu Debet',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )),
                ]),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 10, left: 10),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0x6cc7d1db)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/credit.png',
                    height: 40,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text('Kartu Kredit',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ]),
          ),
        ),
      ]),
    ); //whatever you're returning, does not have to be a Container
  }
}
