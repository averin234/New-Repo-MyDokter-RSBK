import 'package:mydokter_rsbk/app/modules/isi_icd_10/controllers/isi_icd_10_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchICD10 extends StatefulWidget {
  const SearchICD10({super.key});

  @override
  State<SearchICD10> createState() => _SearchICD10State();
}

class _SearchICD10State extends State<SearchICD10> {
  final controller = Get.put(IsiIcd10Controller());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0x6cc7d1db)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 13, right: 15),
              filled: true,
              hintText: "Cari ICD-10",
              hintStyle: TextStyle(fontSize: 15),
              fillColor: Colors.transparent,
            ),
            onSubmitted: (value) {
              controller.srcIcd.value = value;
            },
          ),
        ),
      ],
    );
  }
}
