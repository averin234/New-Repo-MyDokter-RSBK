import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';

class Assestment extends StatefulWidget {
  final String assestment;
  const Assestment({super.key, required this.assestment});

  @override
  State<Assestment> createState() => _AssestmentState();
}

class _AssestmentState extends State<Assestment> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    controller.text = widget.assestment;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.DETAIL_TINDAKAN),
      child: Container(
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 270,
                  child: Text("Subyektif",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                // CircleAvatar(
                //   radius: 30.0,
                //   backgroundImage:
                //   NetworkImage('https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg'),
                //   backgroundColor: Colors.transparent,
                // ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              height: 3,
              color: Colors.grey,
            ),
            TextField(
              controller: controller,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              maxLines: 7,
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                enabled: true,
                disabledBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 13, right: 15),
                filled: true,
                fillColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
