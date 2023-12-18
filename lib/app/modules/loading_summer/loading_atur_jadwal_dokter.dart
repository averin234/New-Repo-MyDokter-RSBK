import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class shimmerAturJadwal extends StatelessWidget {
  const shimmerAturJadwal({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 355),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0x6cc7d1db)),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(children: [
                          Shimmer(
                            child:
                            Container(
                              height: 15,
                              decoration: BoxDecoration(
                                color: const Color(0xFFBACDDB),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(10),
                              constraints: const BoxConstraints(minWidth: 120, maxWidth: 155),
                            ),),
                          const SizedBox(
                            width: 27,
                          ),
                          Shimmer(
                            child:
                            Container(
                              height: 20,
                              decoration: BoxDecoration(
                                color: const Color(0xFFBACDDB),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(10),
                              constraints: const BoxConstraints(minWidth: 20, maxWidth: 65),
                            ),),
                          const SizedBox(
                            width: 10,
                          ),
                          Shimmer(
                            child:
                            Container(
                              height: 20,
                              decoration: BoxDecoration(
                                color: const Color(0xFFBACDDB),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(10),
                              constraints: const BoxConstraints(minWidth: 20, maxWidth: 65),
                            ),),
                        ],),
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
                            constraints: const BoxConstraints(minWidth: 120, maxWidth: 255),
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
                            constraints: const BoxConstraints(minWidth: 120, maxWidth: 255),
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
                            constraints: const BoxConstraints(minWidth: 120, maxWidth: 255),
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
                            constraints: const BoxConstraints(minWidth: 120, maxWidth: 255),
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