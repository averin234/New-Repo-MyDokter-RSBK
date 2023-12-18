import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class shimmerSurat extends StatelessWidget {
  const shimmerSurat({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 355),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0x6cc7d1db)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Shimmer(
                      child:
                      Container(
                        height: 15,
                        decoration: BoxDecoration(
                          color: const Color(0xFFBACDDB),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(10),
                        constraints: const BoxConstraints(minWidth: 120, maxWidth: 145),
                      ),),
                    const SizedBox(width: 10,),
                    Column(
                      children: [
                        Shimmer(
                          child:
                          Container(
                            height: 15,
                            decoration: BoxDecoration(
                              color: const Color(0xFFBACDDB),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(10),
                            constraints: const BoxConstraints(minWidth: 120, maxWidth: 145),
                          ),),

                      ],)
                  ],)),
            const SizedBox(
              height: 10,
            ),
          ]),
    );
  }
}
