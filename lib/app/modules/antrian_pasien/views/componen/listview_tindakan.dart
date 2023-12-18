import 'package:mydokter_rsbk/app/data/model/get_antrian_pasien.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../data/componen/avatar.dart';
import '../../../../routes/app_pages.dart';

class ListViewTindakan extends StatelessWidget {
  final Antrian antrian;
  const ListViewTindakan({super.key, required this.antrian});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () => Get.toNamed(Routes.DETAIL_TINDAKAN, parameters: {
            'no_registrasi': antrian.noRegistrasi ?? '',
            'no_mr': antrian.noMr ?? ''
          }),
          child: Container(
            padding: const EdgeInsets.only(right: 0, left: 10, bottom: 10),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10, bottom: 10, top: 10),
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(antrian.fotoPasien ??
                                (antrian.jenisKelamin == '2'
                                    ? Avatar.lakiLaki
                                    : Avatar.perempuan)),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Text(
                                antrian.namaPasien ?? '',
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("No MR :",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(antrian.noMr ?? '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(
                                    right: 10, top: 10, bottom: 10),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 233, 231, 253),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    const Text(
                                      "Antrian",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      antrian.noAntrian ?? '',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(
                      right: 7, left: 7, top: 7, bottom: 7),
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 219, 246, 253),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Pendaftaran",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month_rounded,
                            color: Color.fromARGB(255, 35, 163, 223),
                            size: 24.0,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text((antrian.tglJamPoli ?? '').substring(0, 10)),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.access_time_filled_rounded,
                            color: Color.fromARGB(255, 35, 163, 223),
                            size: 24.0,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text((antrian.tglJamPoli ?? '').substring(10)),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  builder: (context) => lihat(),
                                ),
                                child: Container(
                                  width: 160,
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10, bottom: 10, top: 10),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 254, 228, 203),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(10.0),
                                        bottomLeft: Radius.circular(10.0)),
                                  ),
                                  child: const Text(
                                    'Lihat',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => Get.toNamed(Routes.DETAIL_TINDAKAN,
                                    parameters: {
                                      'no_registrasi':
                                          antrian.noRegistrasi ?? '',
                                      'no_mr': antrian.noMr ?? ''
                                    }),
                                child: Container(
                                  width: 160,
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10, bottom: 10, top: 10),
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0),
                                        topLeft: Radius.circular(0.0),
                                        bottomLeft: Radius.circular(0.0)),
                                  ),
                                  child: const Text(
                                    'SOAP',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget lihat() {
    return Container(
        height: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.transparent,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 4,
              margin: EdgeInsets.only(
                right: Get.width / 2 - 40,
                left: Get.width / 2 - 40,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFe0e0e0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text("Pasien ${antrian.namaPasien ?? ''}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black)),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 275),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                left: 0, bottom: 10, top: 10),
                            child: CircleAvatar(
                              radius: 30.0,
                              backgroundImage:
                                  NetworkImage(antrian.fotoPasien ?? ''),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Text("Umur :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text("${antrian.umur ?? ''} Tahun",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Text("Golongan Darah :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(antrian.golDarah ?? '',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Text("Alergi :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(antrian.alergi ?? '',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Text("No Hp :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(antrian.noHp ?? '',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Text("Alamat :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    SizedBox(
                                      width: 170,
                                      child: Text(antrian.alamat ?? '',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13)),
                                    ),
                                  ],
                                ),
                              ]),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
