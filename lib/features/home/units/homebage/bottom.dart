import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/features/home/units/homebage/buttonContainer.dart';
import 'package:hoga_load/features/home/units/homebage/swiper1.dart';
import 'package:hoga_load/features/home/units/homebage/swiper2.dart';
import 'package:hoga_load/features/home/units/homebage/tab_view.dart';
import 'package:hoga_load/features/home/units/homebage/vehicle_container.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';

import '../../../blogs/view.dart';
import '../../../plans/view.dart';
import 'blog.dart';
import 'expandable.dart';
import 'features_container.dart';
import 'listview.dart';

class Bottom extends StatefulWidget {
  Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int i = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: CustomText(
                text: 'OUR BUSINESS USP',
                align: TextAlign.center,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFDC52F),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: CustomText(
                text: 'LIST OF FEATURES WE PROVIDE IN HEGALOAD PORTAL',
                align: TextAlign.center,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF000000),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              height: 190.h,
              width: 1.sw,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/Rectangle 21.png'),
                      fit: BoxFit.cover)),
            ),
            FeaturesContainer(' Faster Communication'),
            FeaturesContainer(' Quick item for Sale'),
            FeaturesContainer(' Instant Technical Support'),
            FeaturesContainer(' Easy access to Jobs'),
            FeaturesContainer(' Coverage in Canada & US'),
            FeaturesContainer(' Coverage in Canada & US'),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: CustomText(
                text: 'How We Can Help You In Day To Day Logistics Activity',
                align: TextAlign.center,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF000000),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Row(
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        i = 1;
                      });
                    },
                    child: ButtonContainer(
                        i == 1
                            ? ColorManager.primaryColor
                            : const Color(0xFFA9A9A9),
                        'LOADS & VEHICLES')),
                SizedBox(
                  width: 4.h,
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        i = 2;
                      });
                    },
                    child: ButtonContainer(
                        i == 2
                            ? ColorManager.primaryColor
                            : const Color(0xFFA9A9A9),
                        'JOBS')),
                SizedBox(
                  width: 4.w,
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        i = 3;
                      });
                    },
                    child: ButtonContainer(
                        i == 3
                            ? ColorManager.primaryColor
                            : const Color(0xFFA9A9A9),
                        'PRODUCTS')),
//                SizedBox(
//                  width: 10.h,
//                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            i == 1
                ? TabView(
                'Loads and Vehicle management allows you to connect with other users who are either booking a load or moving from one location to another.',
                ' List and search of Loads',
                'Items according to the type, size, durability and convenience can be uploaded in our system and matching vehicle owners can connect with you directly.',
                ' List and search of Vehicles',
                'Vehicle owners can list their available vehicle movement according to vehicle type, vehicle size, attributes and type of containers to get contacted from load providers.')
                : i == 2
                ? TabView(
                'A user can post available jobs in different locations that are related to logistics industry.',
                ' Post Jobs related to type of contract',
                'Full Time, Part Time, Contractual, Internship and Freelancing jobs can be posted relevant to the industry.',
                ' Jobs related to Category and Job Title can be posted',
                'Various jobs according to the category and with different job titles can be listed on the portal for a quick response from relevant candidates.')
                : TabView(
                'Hegaload system can be used for listing available items for sale and list items which we require with their relevant images and description.',
                ' List item available for Sale',
                'Upload items that are available for sale so that user can contact you directly for their required item.',
                ' Mention your required items',
                'A user can also post items that he needs to purchase with description and approximate price.'),
            Container(
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
              child: const Image(
                  image: AssetImage('assets/images/Rectangle 26.png')),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: CustomText(
                text: 'SERVICES',
                align: TextAlign.center,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFDC52F),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: CustomText(
                text: 'SERVICES WE PROVIDE FOR YOUR DAILY LOGISTICS NEEDS',
                align: TextAlign.center,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF000000),
              ),
            ),
            VehicleContainer(
                'assets/images/load.png',
                'Loads',
                'Go through our available list of loads.',
                'Read More',
                const Color(0xFF2DB6FA)),
            VehicleContainer(
                'assets/images/load.png',
                'Vehicles',
                'Choose your desired vehicle from our system.',
                'Read More',
                const Color(0xFFF68C09)),
            VehicleContainer(
                'assets/images/product.png',
                'Products',
                'Checkout available item for sale and purchase.',
                'Read More',
                const Color(0xFF08DA4E)),
            VehicleContainer('assets/images/jop.png', 'Jobs',
                'Upload your jobs here.', 'Read More', const Color(0xFFE9222C)),
            PlanBody(),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: CustomText(
                text: 'F.A.Q',
                align: TextAlign.center,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFDC52F),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h),
              child: CustomText(
                text: 'FREQUENTLY ASKED QUESTIONS',
                align: TextAlign.center,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF000000),
              ),
            ),
            Expandable('What is Hegaload used for?             ',
                'Hegaload connects you to qualified carriers and puts you in the driver\'s seat to select your carrier of choice.'),
            Expandable('How do I request a booking?            ',
                'Our booking system is a simplified process. You can place a listing online on our portal.'),
            Expandable('How would I know my fare charges & bill amount?',
                'You can directly contact users with their contact information for booking.'),
            Expandable(
                'Who will contact me for my booking or placing a listing on website ?',
                'Users with similar requirements will find you through the search parameters and contact you directly through your contact details.'),
            Expandable(
                'Do you provide Parcel, bike, courier or car transport service?',
                'We as a portal do not provide any transportation services. We are logistics listing application where a user can directly post a requirements and contact user.'),
            Expandable('How do I cancel my Subscription?  ',
                'You can cancel your booking from user dashboard anytime.'),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: CustomText(
                text: 'TESTIMONIALS',
                align: TextAlign.center,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFDC52F),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: CustomText(
                text: 'WHAT THEY ARE SAYING ABOUT US',
                align: TextAlign.center,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF000000),
              ),
            ),
            const swiper1(),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: CustomText(
                text: 'TEAM',
                align: TextAlign.center,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFDC52F),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: CustomText(
                text: 'OUR HARD WORKING TEAM',
                align: TextAlign.center,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF000000),
              ),
            ),
            const listView(),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: CustomText(
                text: 'OUR CLIENTS',
                align: TextAlign.center,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFDC52F),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: CustomText(
                text: 'OUR ASSOCIATE PARTNERS',
                align: TextAlign.center,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF000000),
              ),
            ),
            swiper2(),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: CustomText(
                text: 'BLOG',
                align: TextAlign.center,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFDC52F),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: CustomText(
                text: 'RECENT POSTS FORM OUR BLOG',
                align: TextAlign.center,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF000000),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
          ]),
        ),
        const blog()
      ],
    );
  }
}