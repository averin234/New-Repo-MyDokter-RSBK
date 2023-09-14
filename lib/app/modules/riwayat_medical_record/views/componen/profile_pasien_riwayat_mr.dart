import 'package:mydokter_rsbk/app/data/componen/avatar.dart';
import 'package:mydokter_rsbk/app/data/componen/fetch_data.dart';
import 'package:mydokter_rsbk/app/data/model/get_detail_pasien.dart';
import 'package:flutter/material.dart';

class ProfileRiwayat extends StatelessWidget {
  final Pasien pasien;
  const ProfileRiwayat({super.key, required this.pasien});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10),
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
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
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 270,
                child: Text(pasien.namaPasien ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(pasien.urlFotoPasien ??
                    (pasien.jenKelamin == '3'
                        ? Avatar.perempuan
                        : Avatar.lakiLaki)),
                backgroundColor: Colors.transparent,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            height: 3,
            color: Colors.grey,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("No MR",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13)),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Umur",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13)),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Golongan Darah",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13)),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Jenis Kelamin",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13)),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Alergi",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(":",
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
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(":",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                        const SizedBox(
                          width: 6,
                        ),
                        Text("${pasien.umur ?? ''} tahun",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(":",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(pasien.golDarah ?? '',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(":",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
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
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Text(":",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                        SizedBox(
                          width: 6,
                        ),
                        Text("Tidak Ada",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
