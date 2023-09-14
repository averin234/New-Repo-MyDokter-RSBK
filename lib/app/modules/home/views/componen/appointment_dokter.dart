import 'package:flutter/material.dart';

class CardAppointment extends StatefulWidget {
  const CardAppointment({super.key});

  @override
  State<CardAppointment> createState() => _CardAppointmentState();
}

class _CardAppointmentState extends State<CardAppointment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 4,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 5,
            ),
            const Text("Kunjungan",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 15,
                ),
                Container(
                  width: 90,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 35, 163, 223),
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.1),
                          blurRadius: 8,
                          spreadRadius: 3)
                    ],
                  ),
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text("22",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      SizedBox(
                        height: 4,
                      ),
                      Text("Jumlah",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                      Text("Kunjungan",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  width: 90,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 35, 163, 223),
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.1),
                          blurRadius: 8,
                          spreadRadius: 3)
                    ],
                  ),
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text("12",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      SizedBox(
                        height: 4,
                      ),
                      Text("Jumlah",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                      Text("Resep",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  width: 90,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 35, 163, 223),
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.1),
                          blurRadius: 8,
                          spreadRadius: 3)
                    ],
                  ),
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text("16",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      SizedBox(
                        height: 4,
                      ),
                      Text("Jumlah",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                      Text("Rujukan",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                    ],
                  ),
                ),
              ],
            )
          ]),
    );
  }
}
