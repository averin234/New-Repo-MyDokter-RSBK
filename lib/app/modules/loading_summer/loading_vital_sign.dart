import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class shimmerVitalSign extends StatelessWidget {
  const shimmerVitalSign({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 355),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0x6cc7d1db)),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10,),
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
                                color: Color(0xFFBACDDB),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.all(10),
                              constraints: BoxConstraints(minWidth: 120, maxWidth: 175),
                            ),),
                          SizedBox(
                            width: 77,
                          ),
                          Shimmer(
                            child:
                            Container(
                              height: 25,
                              decoration: BoxDecoration(
                                color: Color(0xFFBACDDB),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.all(10),
                              constraints: BoxConstraints(minWidth: 20, maxWidth: 65),
                            ),),
                        ],),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                        Shimmer(
                          child:
                          Container(
                            height: 10,
                            decoration: BoxDecoration(
                              color: Color(0xFFBACDDB),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(10),
                            constraints: BoxConstraints(minWidth: 120, maxWidth: 135),
                          ),),
                          SizedBox(width: 10,),
                          Shimmer(
                            child:
                            Container(
                              height: 10,
                              decoration: BoxDecoration(
                                color: Color(0xFFBACDDB),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.all(10),
                              constraints: BoxConstraints(minWidth: 120, maxWidth: 135),
                            ),),
                        ],),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Shimmer(
                              child:
                              Container(
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Color(0xFFBACDDB),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.all(10),
                                constraints: BoxConstraints(minWidth: 120, maxWidth: 135),
                              ),),
                            SizedBox(width: 10,),
                            Shimmer(
                              child:
                              Container(
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Color(0xFFBACDDB),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.all(10),
                                constraints: BoxConstraints(minWidth: 120, maxWidth: 135),
                              ),),
                          ],),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Shimmer(
                              child:
                              Container(
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Color(0xFFBACDDB),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.all(10),
                                constraints: BoxConstraints(minWidth: 120, maxWidth: 135),
                              ),),
                            SizedBox(width: 10,),
                            Shimmer(
                              child:
                              Container(
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Color(0xFFBACDDB),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.all(10),
                                constraints: BoxConstraints(minWidth: 120, maxWidth: 135),
                              ),),
                          ],),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Shimmer(
                              child:
                              Container(
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Color(0xFFBACDDB),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.all(10),
                                constraints: BoxConstraints(minWidth: 120, maxWidth: 135),
                              ),),
                            SizedBox(width: 10,),
                            Shimmer(
                              child:
                              Container(
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Color(0xFFBACDDB),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.all(10),
                                constraints: BoxConstraints(minWidth: 120, maxWidth: 135),
                              ),),
                          ],),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Shimmer(
                              child:
                              Container(
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Color(0xFFBACDDB),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.all(10),
                                constraints: BoxConstraints(minWidth: 120, maxWidth: 135),
                              ),),
                            SizedBox(width: 10,),
                            Shimmer(
                              child:
                              Container(
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Color(0xFFBACDDB),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.all(10),
                                constraints: BoxConstraints(minWidth: 120, maxWidth: 135),
                              ),),
                          ],),
                        SizedBox(
                          height: 10,
                        ),
                      ],)
                  ],)),
            SizedBox(
              height: 10,
            ),
          ]),
    );
  }
}
