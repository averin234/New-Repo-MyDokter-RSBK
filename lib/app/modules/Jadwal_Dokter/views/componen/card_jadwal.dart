import 'package:mydokter_rsbk/app/data/componen/fetch_data.dart';
import 'package:mydokter_rsbk/app/data/model/jadwal_dokter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../loading_summer/loading_screen_animed.dart';
import '../jadwal_dokter_view.dart';

class CardJadwal extends StatefulWidget {
  final Jadwal jadwal;
  const CardJadwal({super.key, required this.jadwal});

  @override
  State<CardJadwal> createState() => _CardJadwalState();
}

class _CardJadwalState extends State<CardJadwal> {
  late RefreshController _refreshController;
  void _refreshPage() {
    setState(() {
      _refreshController = RefreshController();
      Get.back();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0x6cc7d1db)),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Jadwal Dokter",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                // GestureDetector(
                //     onTap: () => showModalBottomSheet(
                //           context: context,
                //           shape: const RoundedRectangleBorder(
                //             borderRadius: BorderRadius.vertical(
                //               top: Radius.circular(20),
                //             ),
                //           ),
                //           builder: (context) => buildSheetJadwal(),
                //         ),
                //     child: const Icon(
                //       Icons.edit,
                //       color: Colors.blueAccent,
                //     )),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    onTap: () => showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (context) =>
                              buildSheetHapus(id: widget.jadwal.id.toString()),
                        ),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                    )),
                const SizedBox(
                  width: 10,
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
                const Text('Hari : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(widget.jadwal.rangeHari ?? ''),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text('Jam Mulai : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(widget.jadwal.jamMulai ?? ''),
                const SizedBox(
                  width: 10,
                ),
                const Text('Jam Akhir : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(widget.jadwal.jamAkhir ?? ''),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text('Interval : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text((widget.jadwal.waktu ?? 0).toString()),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }

  Widget buildSheetHapus({required String id}) {
    return Container(
        height: 200,
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
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text("Hapus Jadwal Dokter",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue)),
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
                      const Center(
                        child: Text(
                            'Apakah anda ingin menghapus Jadwal Dokter ini ?'),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () async {
                HapticFeedback.lightImpact();
                Get.defaultDialog(
                  backgroundColor: const Color(0x00e0e0e0),
                  content: const Loading(),
                  title: '',
                  barrierDismissible: false,
                );
                final deleteJadwal = await API.deleteJadwalDokter(id: id);
                if (deleteJadwal.code != 200) {
                  Get.snackbar(deleteJadwal.code.toString(),
                      deleteJadwal.msg.toString());
                } else {
                  Get.back();
                  Navigator.pop(context); // Close the bottom sheet
                  _refreshPage();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const JadwalDokterView()));
                }
              },
              child: Container(
                height: 45,
                width: 145,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hapus",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
