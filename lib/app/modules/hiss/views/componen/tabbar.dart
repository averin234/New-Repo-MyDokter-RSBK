import 'package:flutter/material.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  final menuHiss = [
    'ICD X',
    'Gejala',
    'Penyebab',
    'Penunjang',
    'Penyebab',
    'Pengobatan',
    'Komplikasi',
    'Differensial',
    'Catatan',
    'Pre Existing',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: menuHiss
                .map((e) => Container(
                      margin: const EdgeInsets.only(right: 10, left: 5),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(e),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
