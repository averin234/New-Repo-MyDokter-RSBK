import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';

class HorizontalCalender extends StatelessWidget {
  const HorizontalCalender({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        const Text('Antrian Pasien'),
      Container(
      margin: const EdgeInsets.only(top: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Container(
        padding: const EdgeInsets.all(0),
     child : HorizontalCalendar(
        date: DateTime.now(),
        initialDate: DateTime.now(),
        textColor: Colors.black,
        backgroundColor: Colors.white,
        selectedColor: const Color.fromARGB(255, 35, 163, 223),
        showMonth: true,
        locale: Localizations.localeOf(context),
        onDateSelected: (date) {
          if (kDebugMode) {
            print(date.toString());
          }
        },
      ),
      )
    ),
    ],);
  }
}