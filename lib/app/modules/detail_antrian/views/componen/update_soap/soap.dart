import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'assestment.dart';
import 'objektive.dart';
import 'subyektif.dart';
import '../../../../../routes/app_pages.dart';

class UpdateSoap extends StatefulWidget {
  const UpdateSoap({super.key});

  @override
  State<UpdateSoap> createState() => _UpdateSoapState();
}

class _UpdateSoapState extends State<UpdateSoap> {
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
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text("SOAP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              height: 3,
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            UpdateSubyektif(),
            SizedBox(
              height: 10,
            ),
            Updateobjektive(),
            SizedBox(
              height: 10,
            ),
            UpdateAssestment(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
