import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/hiss_controller.dart';

class SearchHISS extends StatefulWidget {
  const SearchHISS({super.key});

  @override
  State<SearchHISS> createState() => _SearchHISSState();
}

class _SearchHISSState extends State<SearchHISS> {
  final controller = Get.put(HissController());
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
              hintText: "Penyakit",
              fillColor: Colors.transparent,
            ),
            onSubmitted: (value) {
              controller.namaPenyakit.value = value;
            },
          ),
        ),
      ],
    );
  }
}
