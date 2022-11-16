import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/widgets/custom_text.dart';
class ButtonContainer extends StatelessWidget {
   ButtonContainer(this.color,this.text, {super.key}) ;
Color color;
String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 35.h,

      decoration: BoxDecoration(
          color:color,
          borderRadius: BorderRadius.circular(7.r)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.all(9.r),
              child: CustomText(
                text: text,
<<<<<<< HEAD
                fontSize: 12.sp,
=======

                fontSize: 14.sp,
>>>>>>> b6858b9803a35ccae61312e3a1435e870a704322
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFFFFFF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
