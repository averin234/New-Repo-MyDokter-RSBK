import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class shimmerSurat extends StatelessWidget {
  const shimmerSurat({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 355),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0x6cc7d1db)),
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
                          color: Color(0xFFBACDDB),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(10),
                        constraints: BoxConstraints(minWidth: 120, maxWidth: 145),
                      ),),
                    SizedBox(width: 10,),
                    Column(
                      children: [
                        Shimmer(
                          child:
                          Container(
                            height: 15,
                            decoration: BoxDecoration(
                              color: Color(0xFFBACDDB),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(10),
                            constraints: BoxConstraints(minWidth: 120, maxWidth: 145),
                          ),),

                      ],)
                  ],)),
            SizedBox(
              height: 10,
            ),
          ]),
    );
  }
}
