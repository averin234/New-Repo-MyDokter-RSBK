import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class shimmerPasienLama extends StatelessWidget {
  const shimmerPasienLama({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 355),
      child: Column(children: [
        Container(
          padding: EdgeInsets.all(10),
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
            border: Border.all(color: Color(0x6cc7d1db)),
          ),
          child: Column(children: [
            Row(
              children: [
                SizedBox(width: 10,),
                Column(children: [
                  Shimmer(
                    child:
                    Container(
                      height: 10,
                      decoration: BoxDecoration(
                        color: Color(0xFFBACDDB),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      constraints: BoxConstraints(minWidth: 120, maxWidth: 195),
                    ),),
                  SizedBox(
                    height: 10,
                  ),
                  Shimmer(
                    child:
                    Container(
                      height: 10,
                      decoration: BoxDecoration(
                        color: Color(0xFFBACDDB),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      constraints: BoxConstraints(minWidth: 120, maxWidth: 195),
                    ),),
                ],),
              ],),
          ],),),
        SizedBox(
          height: 10,
        ),

      ]),
    );
  }
}
