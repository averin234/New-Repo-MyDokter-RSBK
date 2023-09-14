import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';

class HorizontalCalender extends StatelessWidget {
  const HorizontalCalender({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Text('Antrian Pasien'),
      Container(
      margin: EdgeInsets.only(top: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Container(
        padding: EdgeInsets.all(0),
     child : HorizontalCalendar(
        date: DateTime.now(),
        initialDate: DateTime.now(),
        textColor: Colors.black,
        backgroundColor: Colors.white,
        selectedColor: Color.fromARGB(255, 35, 163, 223),
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