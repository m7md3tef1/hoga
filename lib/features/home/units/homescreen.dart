import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/router/router.dart';
import 'package:hoga_load/features/home/units/homebage/bottom.dart';
import 'package:hoga_load/features/home/units/homebage/expandable.dart';
import 'package:hoga_load/features/plans/view.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';
import '../../about/view.dart';

import 'homebage/body.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static GlobalKey<ScaffoldState> scaffoldStateKey = GlobalKey<ScaffoldState>();
Future<bool?> showWarning(BuildContext context)async =>showDialog<bool>(
    context: context, builder: (context)=>
AlertDialog(
  title: const Text('Do You want to exit app?'),
  actions: [
    ElevatedButton(onPressed: ()=>Navigator.pop(context,false), child: const Text('No')),
    ElevatedButton(onPressed: ()=>Navigator.pop(context,true), child: const Text('Yes')),
  ],
)
);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        final shouldPop=await showWarning(context);
        return shouldPop??false;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30.sp,),
          CustomAppbar(title: 'Home Screen',),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 8.sp,horizontal: 15.sp),
              child:
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
            ),
          ),
        ],
      ),
    );
  }
}
