import 'package:mydokter_rsbk/app/data/componen/publics.dart';
import 'package:mydokter_rsbk/app/data/model/get_pasien_by.dart';
import 'package:mydokter_rsbk/app/modules/medical_record/views/componen/listview_tindakan.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:search_page/search_page.dart';

import '../../../../data/componen/fetch_data.dart';

class CariPasien extends StatefulWidget {
  const CariPasien({super.key});

  @override
  State<CariPasien> createState() => _CariPasienState();
}

class _CariPasienState extends State<CariPasien> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 254, 228, 203),
            borderRadius: BorderRadius.circular(22),
          ),
          child: FutureBuilder(
            future: API.getPasienBy(
                query: Publics.controller.getDataRegist.value.kode ?? ''),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData && snapshot.data != null) {
                final data = snapshot.data!.pasien;

                if (data != null && data.isNotEmpty) {
                  return TextField(
                    readOnly: true,
                    onTap: () => showSearch(
                        context: context,
                        delegate: SearchPage<Pasien>(
                            items: data,
                            searchLabel: 'Cari Nama Pasien',
                            searchStyle:
                                GoogleFonts.nunito(color: Colors.black),
                            showItemsOnEmpty: true,
                            failure: Center(
                              child: Text(
                                'Tidak ada pembayaran :(',
                                style: GoogleFonts.nunito(),
                              ),
                            ),
                            filter: (pasien) => [
                                  pasien.namaPasien,
                                  pasien.noMr,
                                ],
                            builder: (pasien) => Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ListViewPasien(pasien: pasien),
                                  ],
                                ))),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                          left: 15, bottom: 11, top: 13, right: 15),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          print('search');
                        },
                      ),
                      filled: true,
                      hintText: "Pencarian",
                      fillColor: Colors.transparent,
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      'Pencarian',
                      style: GoogleFonts.nunito(fontSize: 16),
                    ),
                  );
                }
              } else {
                return Center(
                  child: Text(
                    'Terjadi kesalahan saat mengambil data.',
                    style: GoogleFonts.nunito(fontSize: 12),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
