import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class shimmerSetting extends StatelessWidget {
  const shimmerSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 355),
      child: Column(children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10 ),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0x6cc7d1db)),
          ),
          child: Row(
            children: [
          Shimmer(
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              color: const Color(0xFFBACDDB),
              borderRadius: BorderRadius.circular(100),
            ),
            padding: const EdgeInsets.all(10),
            constraints: const BoxConstraints(minWidth: 50, maxWidth: 90),
          ),
        ),
            const SizedBox(width: 10,),
            Column(children: [
              Shimmer(
                child:
              Container(
                height: 10,
                decoration: BoxDecoration(
                  color: const Color(0xFFBACDDB),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                constraints: const BoxConstraints(minWidth: 120, maxWidth: 195),
              ),),
              const SizedBox(
                height: 20,
              ),
              Shimmer(
                child:
              Container(
                height: 10,
                decoration: BoxDecoration(
                  color: const Color(0xFFBACDDB),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                constraints: const BoxConstraints(minWidth: 120, maxWidth: 195),
              ),),
              const SizedBox(
                height: 10,
              ),
              Shimmer(
                child:
              Container(
                height: 10,
                decoration: BoxDecoration(
                  color: const Color(0xFFBACDDB),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                constraints: const BoxConstraints(minWidth: 120, maxWidth: 195),
              ),),
              const SizedBox(
                height: 10,
              ),
              Shimmer(
                child:
              Container(
                height: 10,
                decoration: BoxDecoration(
                  color: const Color(0xFFBACDDB),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                constraints: const BoxConstraints(minWidth: 120, maxWidth: 195),
              ),),
              const SizedBox(
                height: 10,
              ),
              Shimmer(
                child:
              Container(
                height: 10,
                decoration: BoxDecoration(
                  color: const Color(0xFFBACDDB),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                constraints: const BoxConstraints(minWidth: 120, maxWidth: 195),
              ),),
              const SizedBox(
                height: 10,
              ),
            ],)
            ],)),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}
