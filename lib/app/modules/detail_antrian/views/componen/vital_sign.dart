import 'package:mydokter_rsbk/app/data/model/get_detail_mr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../data/componen/fetch_data.dart';
import '../../../../data/model/list_data.dart';
import '../../../../routes/app_pages.dart';
import '../../../loading_summer/loading_screen_animed.dart';
import '../../controllers/detail_tindakan_controller.dart';
import '../detail_tindakan_view.dart';

class VitalSignView extends GetView<DetailTindakanController> {
  final VitalSign vitalSign;
  VitalSignView(
      {super.key,
      required this.vitalSign}); // this is our key to the scaffold widget

  @override
  Widget build(BuildContext context) {
    late RefreshController _refreshController;
    return InkWell(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  width: 210,
                  child: Text("VITAL SIGN",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (BuildContext context) => UpdateVitalSign()),
                  child: Container(
                    height: 30,
                    width: 120,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 33, 146, 255),
                      borderRadius: BorderRadius.circular(10),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.blue.withOpacity(0.5),
                      //     spreadRadius: 0,
                      //     blurRadius: 10,
                      //     offset: const Offset(2, 1),
                      //   ),
                      // ],
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Update Vital Sign",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              height: 10,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Keadaan Umum :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(vitalSign.keadaanUmum ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Tekanan Darah :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(vitalSign.tekananDarah ?? '',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                          SizedBox(
                            width: 10,
                          ),
                          Text('mmHg'),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Suhu :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(vitalSign.suhu ?? '',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                          SizedBox(
                            width: 10,
                          ),
                          Text('°/Celcius')
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Tinggi Badan :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(vitalSign.tinggiBadan ?? '',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Cm')
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 80,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Kesadaran :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(vitalSign.kesadaranPasien ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Nadi :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(vitalSign.nadi ?? '',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                          SizedBox(
                            width: 10,
                          ),
                          Text('x/menit'),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Pernafasan :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(vitalSign.pernafasan ?? '',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                          SizedBox(
                            width: 10,
                          ),
                          Text('x/menit')
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Berat Badan :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(vitalSign.beratBadan ?? '',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                          SizedBox(
                            width: 10,
                          ),
                          Text('kg')
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget dropdown(String hintText, List<Lists> listData,
      TextEditingController controller, TextEditingController controller1) {
    return AppTextField(
      textEditingController: controller,
      textEditingController1: controller1,
      hint: hintText,
      isCitySelected: true,
      lists: listData,
      title: '',
    );
  }
}

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
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}

class UpdateVitalSign extends StatefulWidget {
  const UpdateVitalSign({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _UpdateVitalSignState createState() => _UpdateVitalSignState();
}

class _UpdateVitalSignState extends State<UpdateVitalSign> {
  // this enable our app to able to pull down
  late RefreshController _refreshController; // the refresh controller
  final controller = Get.put(DetailTindakanController());
  @override
  Widget build(BuildContext context) {
    return Container(
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
              height: 4,
            ),
            const Text('Geser Kebawah',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 0),
              child: Text("Tambah Vital Sign",
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
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Keadaan Umum",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: FutureBuilder(
                          future: API.getkeadaanUmum(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData &&
                                snapshot.connectionState !=
                                    ConnectionState.waiting &&
                                snapshot.data != null) {
                              final data = snapshot.data!.list ?? [];
                              return data.isEmpty
                                  ? Text(snapshot.data!.msg ?? '')
                                  : dropdown(
                                      'Keadaan Umum',
                                      data,
                                      controller.keadaanUmumController,
                                      controller.namaKeadaanUmumController);
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Tekanan Darah",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xfff3f3f3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: controller.tekananDarahController,
                          decoration: const InputDecoration(
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(top: 15, right: 10),
                              child: Text('mmHg'),
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 13, right: 15),
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Suhu",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xfff3f3f3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: controller.suhuController,
                          decoration: const InputDecoration(
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(top: 15, right: 10),
                              child: Text('°/Celcius'),
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 13, right: 15),
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Tinggi Badan",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xfff3f3f3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: controller.tinggiBadanController,
                          decoration: const InputDecoration(
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text('Cm'),
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 13, right: 15),
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Kesadaran Pasien",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: FutureBuilder(
                          future: API.getKesadaranPasien(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData &&
                                snapshot.connectionState !=
                                    ConnectionState.waiting &&
                                snapshot.data != null) {
                              final data = snapshot.data!.list ?? [];
                              return data.isEmpty
                                  ? Text(snapshot.data!.msg ?? '')
                                  : dropdown(
                                      'Kesadaran',
                                      data,
                                      controller.kesadaranController,
                                      controller.namaKesadaranController);
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Nadi",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xfff3f3f3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: controller.nadiController,
                          decoration: const InputDecoration(
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(top: 15, right: 10),
                              child: Text('x/menit'),
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 13, right: 15),
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Pernafasan",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xfff3f3f3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: controller.pernapasanController,
                          decoration: const InputDecoration(
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(top: 15, right: 10),
                              child: Text('x/menit'),
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 13, right: 15),
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Berat Badan",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xfff3f3f3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: controller.beratBadanController,
                          decoration: const InputDecoration(
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text('kg'),
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 13, right: 15),
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 400,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async {
                Get.defaultDialog(
                  backgroundColor: const Color(0x00e0e0e0),
                  content: Loading(),
                  title: '',
                  barrierDismissible: false,
                );
                final postVS = await API.postVitalSign(
                    no_registrasi: controller.noRegistrasi,
                    keadaan_umum: controller.keadaanUmumController.text,
                    kesadaran_pasien: controller.kesadaranController.text,
                    tekanan_darah: controller.tekananDarahController.text,
                    nadi: controller.nadiController.text,
                    suhu: controller.suhuController.text,
                    pernapasan: controller.pernapasanController.text,
                    tinggi_badan: controller.tinggiBadanController.text,
                    berat_badan: controller.beratBadanController.text);
                _refreshPage();
                Get.back();
                if (postVS.code != 200) {
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailTindakanView()),
                  );
                  // Get.toNamed(
                  //     Routes.DETAIL_TINDAKAN);
                  // Get.back();
                  // Navigator.pop(context);// Close the bottom sheet
                  // _refreshPage();
                  // showModalBottomSheet(
                  //   context:
                  //   context,
                  //   shape:
                  //   const RoundedRectangleBorder(
                  //     borderRadius:
                  //     BorderRadius
                  //         .vertical(
                  //       top: Radius
                  //           .circular(
                  //           20),
                  //     ),
                  //   ),
                  //   builder:
                  //       (context) =>
                  //       buildSheet(),
                  // );
                  Get.defaultDialog(
                    title: (postVS.code ?? 0).toString(),
                    content: Text(postVS.msg ?? ''),
                  );
                }
              },
              child: Container(
                height: 45,
                width: 145,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 56, 229, 77),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Update Vital Sign",
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

  Widget dropdown(String hintText, List<Lists> listData,
      TextEditingController controller, TextEditingController controller1) {
    return AppTextField(
      textEditingController: controller,
      textEditingController1: controller1,
      hint: hintText,
      isCitySelected: true,
      lists: listData,
      title: '',
    );
  }

  void _refreshPage() {
    setState(() {
      _refreshController =
          RefreshController(); // Melakukan perubahan pada Rx variable
      Get.back();
    });
  }
}
