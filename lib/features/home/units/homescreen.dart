import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/features/home/units/homebage/bottom.dart';
import 'package:hoga_load/features/plans/view.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';

import '../../about/view.dart';

import 'homebage/body.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static GlobalKey<ScaffoldState> scaffoldStateKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            CustomAppbar(title: 'Home Screen',),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 8.sp,horizontal: 15.sp),
              child: Column(
                children: [
                   body(),
                  SizedBox(
                    height: 38.h,
                  ),
                   const Video(),
                  const Values(),
                  const Contact(),
                   const Bottom(),


                ],
              ),
            ),
          ],
        ),

    );
  }
}
