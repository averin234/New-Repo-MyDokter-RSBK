import 'package:mydokter_rsbk/app/data/componen/avatar.dart';
import 'package:mydokter_rsbk/app/data/model/get_pasien_by.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/componen/fetch_data.dart';
import '../../../../routes/app_pages.dart';

class ListViewPasien extends StatelessWidget {
  final Pasien pasien;
  const ListViewPasien({super.key, required this.pasien});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        onTap: () => Get.toNamed(Routes.RIWAYAT_MEDICAL_RECORD,
            parameters: {'no_mr': pasien.noMr ?? ''}),
        child: Container(
          margin: const EdgeInsets.only(right: 10, left: 10, bottom: 0),
          padding: const EdgeInsets.only(right: 0, left: 10, bottom: 5),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0x6cc7d1db)),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                  child: Row(children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(pasien.foto ??
                          (pasien.jenKelamin == '2'
                              ? Avatar.lakiLaki
                              : Avatar.perempuan)),
                      backgroundColor: Colors.transparent,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(pasien.namaPasien ?? '',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text("No MR :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(pasien.noMr ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.phone,
                              color: Colors.grey,
                              size: 20.0,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(pasien.noHp ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.person,
                              color: Colors.grey,
                              size: 20.0,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            FutureBuilder(
                                future: API.cekJenisKelamin(
                                    jenis_kelamin: pasien.jenKelamin ?? ''),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData &&
                                      snapshot.connectionState !=
                                          ConnectionState.waiting &&
                                      snapshot.data != null) {
                                    return Text(snapshot.data!.msg ?? '',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13));
                                  } else {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                }),
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.bloodtype,
                              color: Colors.grey,
                              size: 20.0,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(pasien.golDarah ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        ),
                      ],
                    ),
                  ])),
              const SizedBox(
                width: 10,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 219, 246, 253),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const Text("Cek MR",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        'assets/images/mrpoto.png',
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
    ]);
  }
}
