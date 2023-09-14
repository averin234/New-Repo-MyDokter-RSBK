import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropdownHISS extends StatefulWidget {
  const DropdownHISS({super.key});

  @override
  State<DropdownHISS> createState() => _DropdownHISSState();
}

class _DropdownHISSState extends State<DropdownHISS> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Expanded(
            child: DropdownSearch<int>(
              items: List.generate(50, (i) => i),
              popupProps: const PopupProps.bottomSheet(
                showSearchBox: true,
                fit: FlexFit.tight,
                title: Text('Pencarian'),
                constraints: BoxConstraints(maxHeight: 300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
