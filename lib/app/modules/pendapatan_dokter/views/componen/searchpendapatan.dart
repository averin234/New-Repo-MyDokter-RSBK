
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mydokter_rsbk/app/modules/pendapatan_dokter/views/componen/tabel_pendapatan.dart';
import 'package:search_page/search_page.dart';

import '../../../../data/componen/fetch_data.dart';
import '../../../../data/componen/publics.dart';
import '../../../../data/model/get_list_kasir.dart';
import '../../../../data/model/profile_pasien/get_tunai.dart';

class SearchPendapatan1 extends StatefulWidget {
  const SearchPendapatan1({super.key});

  @override
  State<SearchPendapatan1> createState() => _SearchPendapatan1State();
}

class _SearchPendapatan1State extends State<SearchPendapatan1> {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 233, 231, 253),
            borderRadius: BorderRadius.circular(22),
          ),
          child: FutureBuilder(
            future: API.getListKasir(
                kode_dokter: Publics.controller.getDataRegist.value.kode ?? ''),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData && snapshot.data != null) {
                final data = snapshot.data!.kasir;

                if (data != null && data.isNotEmpty) {
                  return TextField(
                    readOnly: true,
                    onTap: () => showSearch(
                      context: context,
                      delegate: SearchPage<Kasir>(
                        items: data,
                        searchLabel: 'Cari Nama Pasien',
                        searchStyle: GoogleFonts.nunito(color: Colors.black),
                        showItemsOnEmpty: true,
                        failure: Center(
                          child: Text(
                            'Tidak ada pembayaran :(',
                            style: GoogleFonts.nunito(),
                          ),
                        ),
                        filter: (kasir) => [
                          kasir.namaPasien,
                          kasir.noRegistrasi,
                          kasir.namaBagian,
                        ],
                        builder: (kasir) => Column(children: [
                          SizedBox(
                            height: 10,
                          ),
                            Pendapatan(kasir: kasir),],)
                      ),
                    ),
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
          )
        ),
      ],
    );
  }
}
