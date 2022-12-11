import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/color_manager/color_manager.dart';
import '../../../core/router/router.dart';
import '../../../widgets/widgets/custom_text.dart';
import 'add_product_form.dart';
class UploadedTableAdvertisment extends StatelessWidget {
  UploadedTableAdvertisment({super.key, required this.child});
  Widget child;

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: SizedBox(
        height: 0.7.sh,

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: CustomText(
                      text: 'UPLOADED ADVERTISEMENTS',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                      MagicRouter.navigateTo(const FormAdvertisment() );
                  },
                  child: Expanded(
                    flex: 2,
                    child: Center(
                      child: CustomText(
                        text: '[ Add + ]',
                        fontSize: 18.sp,
                        color: ColorManager.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: Container(
                  height: 43.h,
                  width: 1.sw,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex:1,
                        child: CustomText(
                          text: "#",
                          fontSize: 11.sp,
                          align: TextAlign.start,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Expanded(
                        flex:2,
                        child: CustomText(
                          text: "Start Date",
                          fontSize: 11.sp,
                          align: TextAlign.start,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Expanded(
                        flex:2,
                        child: CustomText(
                          text: "End Date",
                          fontSize: 11.sp,
                          align: TextAlign.start,
                          fontWeight: FontWeight.w700,
                        ),
                      ),


                    ],
                  )

              ),
            ),
             SizedBox(
              height: 12.h,
              child:const Divider(thickness: 1,),
            ),
            Expanded(child: child)

          ],
        ),

      ),
    );
  }
}