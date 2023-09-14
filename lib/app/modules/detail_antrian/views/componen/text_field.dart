import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../data/model/list_data.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextEditingController textEditingController1;
  final String title;
  final String hint;
  final bool isCitySelected;
  final List<Lists> lists;

  const AppTextField({
    required this.textEditingController,
    required this.textEditingController1,
    required this.title,
    required this.hint,
    required this.isCitySelected,
    required this.lists,
    Key? key,
  }) : super(key: key);

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    showModalBottomSheet<void>(
      context: Get.context!,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Column(
          children: [
            Divider(
              thickness: 5,
              endIndent: Get.width * 0.4,
              indent: Get.width * 0.4,
              height: 25,
            ),
            Expanded(
              child: ListView(
                children: lists
                    .map(
                      (e) => TextButton(
                        style: TextButton.styleFrom(
                            alignment: Alignment.centerLeft,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10)),
                        child: Text(
                          e.nama!,
                          style: GoogleFonts.nunito(
                            fontSize: 17.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          textEditingController.text = e.kode!;
                          textEditingController1.text = e.nama!;
                          Get.back();
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        );
      },
    );
  }

  void showSnackBar(String message) {
    Get.snackbar(title, message);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.width / 8,
      width: Get.width / 1,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        readOnly: true,
        controller: textEditingController1,
        cursorColor: Colors.black,
        onTap: onTextFieldTap,
        decoration: InputDecoration(
          filled: true,
          suffixIcon: const Icon(Icons.arrow_drop_down_circle),
          contentPadding:
              const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 0),
          hintText: hint,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
