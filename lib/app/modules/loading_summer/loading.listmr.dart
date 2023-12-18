import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class shimmerListMr extends StatelessWidget {
  const shimmerListMr({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 355),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFe0e0e0).withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(2, 1),
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0x6cc7d1db)),
          ),
          child: Column(children: [
            Row(
              children: [
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

                ],),
              ],),
          ],),),
        const SizedBox(
          height: 10,
        ),

      ]),
    );
  }
}
