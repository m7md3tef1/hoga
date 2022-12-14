import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hoga_load/core/app_images/app_images.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/core/widgets/custom_card.dart';
import 'package:hoga_load/features/blogs/blog_details.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';

import '../../core/data/models/loads/GetLoads_model.dart';
import '../../core/data/models/vehicle/vehicles.dart';
import '../../core/router/router.dart';

class CustomContainerLoad extends StatelessWidget {
  final Vehicles load;
  const CustomContainerLoad(this.load, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(

      widget: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Padding(
      padding: EdgeInsets.only(
      top: 15.h,
        left: 8.sp,
        right: 8.sp,
      bottom: 10.sp
      ),
        child: CustomText(
          text:
          "${load.originCity == null ? "other" : load.originCity!.title}"
              " (${load.originState == null ? "other" : load.originState!.title} , "
              "${load.originCountry == null ? "other" : load.originCountry!.title}) "
              " → "
              "${load.destinationCity == null ? "other" : load.destinationCity!.title}"
              " (${load.destinationState == null ? "other" : load.destinationState!.title} , "
              "${load.destinationCountry == null ? "other" : load.destinationCountry!.title}) ",
          fontSize: 17.sp,
          fontWeight: FontWeight.w600,
          color: ColorManager.primaryColor,
        ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person_outline,
                        color: ColorManager.primaryColor,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: CustomText(
                          text: load.user == null
                              ? 'other'
                              : load.user!.username.toString(),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.access_time_outlined,
                        color: ColorManager.primaryColor,
                      ),
                      Expanded(
                        child: CustomText(
                          align: TextAlign.start,
                          text: '${load.availabilityDate}',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/images/Chat_Circle_Dots.svg',
                        height: 25.h,
                        width: 25.w,
                        fit: BoxFit.cover,
                        color: ColorManager.primaryColor,
                      ),
                      Expanded(
                        child: CustomText(
                          text: '${load.weight} Kg(s)' ?? 'other',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              height: 7.h,
              width: 1.sw,
              child: const Divider(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 33.w, bottom: 15.h, top: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(text: 'CONTACT DETAILS'),
                    ],
                  ),
                ),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Padding(
                      padding: EdgeInsets.only(
                          left: 5.w, bottom: 15.h, right: 5.w, top: 15.h),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.phone_callback,
                            color: ColorManager.primaryColor,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          CustomText(
                            text: load.user == null
                                ? 'other'
                                : load.user!.contactNumber.toString(),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                        ],
                      ),
                    ),
                    
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.email_outlined,
                            color: ColorManager.primaryColor,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Expanded(
                            child: CustomText(
                              text: load.user == null
                                  ? 'other'
                                  : load.user!.email.toString(),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
