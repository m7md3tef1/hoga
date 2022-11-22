import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import '../../../../core/color_manager/color_manager.dart';
import '../../../../widgets/widgets/custom_text.dart';

class body extends StatelessWidget {
   body({Key? key}) : super(key: key);
  var text=['MANAGE YOUR LOADS AND VEHICLE ON SINGLE PLACE','POST JOBS AND ITEMS FOR SALE SEAMLESSLY'];

  var hint=['Find users available with list of Vehicles or Loads they need to move from one place to another',
    'We provide system to list items for sale and purchase along with current job opening'
  ];



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 249.h,
          width: 1.sw,
          decoration: const BoxDecoration(
            color: ColorManager.primaryColor,
            image: DecorationImage(
                image: AssetImage('assets/images/Rectangle 18.png'),fit: BoxFit.fill),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 15.r, right: 15.r,top: 15.h,bottom: 15.h),
            child: Center(
                child: Swiper(
                  pagination: const SwiperPagination(
                    builder: SwiperPagination.rect,
                    alignment: Alignment.bottomCenter,
                  ),
                  itemCount: text.length,
                itemBuilder: (context, index) => Container(
                    height: 130.h,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.7),
                    ),
                    child: Container(
                      height: 20.h,

                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 23.r, right: 23.r,bottom: 8.h,top: 8.h),
                              child: CustomText(
                                align: TextAlign.start,
                                text:
                                    text[index],
                                fontSize: 19.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFFFFFFF),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: 23.r, right: 23.r),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xFFFDC52F))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomText(
                                    align: TextAlign.start,
                                    text:
                                        hint[index],
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ),
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                align: TextAlign.start,
                text: 'WHO WE ARE',
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFDC52F),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
          child: CustomText(
            align: TextAlign.start,
            text:
                'We are Logistics integrators with seamless communication between Load uploaders and carrier owners for their smooth transition of loads.',
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF000000),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: CustomText(
            align: TextAlign.start,
            text:
                'We have been regularly updating system towards building a world class solution of Loads, Vehicles, Market and Jobs for an accessible solution towards communication and transparent upload machanism. Every user is given access to platform for their easy communication towards making logistics better.',
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF6C6C6C),
          ),
        ),
        SizedBox(
          height: 22.h,
        ),
      ],
    );
  }
}
