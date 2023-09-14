import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Cetekan extends StatelessWidget {
  Cetekan({Key? key}) : super(key: key);

  // Create a webview controller
  final _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // print the loading progress to the console
          // you can use this value to show a progress bar if you want
          debugPrint("Loading: $progress%");
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(
        "https://a-dokter.id/02_poli/pemeriksaan_print.php?no_mr=2207-0000001&no_registrasi=1192&no_kunjungan=1192&kd_bagian=010001"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        title: const Text('Webview Example'),
      ),
      body: SizedBox(
          width: double.infinity,
          // the most important part of this example
          child: WebViewWidget(
            controller: _controller,
          )),
    );
  }
}
