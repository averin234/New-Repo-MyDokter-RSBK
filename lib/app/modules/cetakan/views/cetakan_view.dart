import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'package:get/get.dart';

import '../controllers/cetakan_controller.dart';

class CetakanView extends GetView<CetakanController> {
  const CetakanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        title: const Text('PDF'),
      ),
      body: PDFView(
        filePath: controller.filePath,
      ),
    );
  }
}
