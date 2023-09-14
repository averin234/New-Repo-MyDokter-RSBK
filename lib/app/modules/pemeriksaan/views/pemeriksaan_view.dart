import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pemeriksaan_controller.dart';

class PemeriksaanView extends GetView<PemeriksaanController> {
  const PemeriksaanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PemeriksaanView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PemeriksaanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
