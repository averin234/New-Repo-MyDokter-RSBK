import 'package:flutter/material.dart';

import '../../../../data/componen/avatar.dart';
import '../../../../data/model/get_detail_dokter.dart';

class CardDokterCV extends StatelessWidget {
  final Dokter dokter;
  const CardDokterCV({super.key, required this.dokter});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(right: 10, left: 10, bottom: 0),
        padding: const EdgeInsets.only(right: 0, left: 10, bottom: 10),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0x6cc7d1db)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage:
                          NetworkImage(dokter.foto ?? Avatar.lakiLaki),
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
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Text("Profil Dokter",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            SizedBox(
                              width: 100,
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text("Nama Lengkap :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(dokter.namaPegawai ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text("Email :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(dokter.email ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text("HP :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(dokter.telp ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text("Alamat :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                            const SizedBox(
                              width: 6,
                            ),
                            SizedBox(
                              width: 190,
                            child : Text(dokter.alamat ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),),
                          ],
                        ),
                      ]),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ]),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
