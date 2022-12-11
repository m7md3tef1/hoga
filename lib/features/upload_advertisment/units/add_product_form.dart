import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/features/packages/cubit/package_cubit.dart';
import 'package:hoga_load/features/packages/cubit/package_states.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';
import 'package:hoga_load/widgets/widgets/custom_text_field.dart';

import '../../../core/color_manager/color_manager.dart';
import '../../../core/data/models/Packages_detail.dart';
import '../../../core/data/models/Upload_adv.dart';
import '../../../core/widgets/custom_card.dart';
import '../../../widgets/widgets/custom_button.dart';
import '../../auth/units/customer_text_field.dart';
import '../../dashboard/cubit/updateProfile_cubit.dart';
import '../../home/view.dart';
import '../../search_product/cubit/getProduct__states.dart';
import '../../search_product/cubit/getProduct_cubit.dart';

class FormAdvertisment extends StatefulWidget {
  const FormAdvertisment({
    Key? key,
  }) : super(key: key);

  @override
  State<FormAdvertisment> createState() => _FormAdvertismentState();
}

class _FormAdvertismentState extends State<FormAdvertisment> {
  String? imageFile;
  GlobalKey<ScaffoldState> uploadedProductsScaffoldKey =
      GlobalKey<ScaffoldState>();
  TextEditingController linkController = TextEditingController();
  var imag2 = '';
  var imag1 = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imag2 = ProductsCubit.get(context).image1 != null
        ? '${ProductsCubit.get(context).image1.toString().split('/data/user/0/com.example.hoga_load/cache/image_picker')}'
        : '    No File chosen';
    imag1 = ProductsCubit.get(context).image != null
        ? '${ProductsCubit.get(context).image.toString().split('/data/user/0/com.example.hoga_load/cache/image_picker')}'
        : '    No File chosen';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: OnDrawer(),
      key: uploadedProductsScaffoldKey,
      body: BlocConsumer<ProductsCubit, AddProductStates>(
        listener:(context,state){} ,
        builder:(context,state){
          return BlocConsumer<PackageCubit,PackageStates>(
            listener: (context,state){},
            builder:(context,state){
              imag2 = ProductsCubit.get(context).image1 != null
                  ? '${ProductsCubit.get(context).image1.toString().split('/data/user/0/com.example.hoga_load/cache/image_picker')}'
                  : '    No File chosen';
              imag1 = ProductsCubit.get(context).image != null
                  ? '${ProductsCubit.get(context).image.toString().split('/data/user/0/com.example.hoga_load/cache/image_picker')}'
                  : '    No File chosen';
              return
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomAppbar(
                    title: 'UPLOAD ADVERTISEMENT BANNER',
                    font: 18.sp,
                    scaffoldKey: uploadedProductsScaffoldKey,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: CustomCard(
                                widget: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8.0, horizontal: 14.w),
                                            child: Column(
                                              //   mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    CustomText(
                                                      text: 'Banner for Desktop Devices',
                                                      align: TextAlign.start,
                                                      color: Colors.grey,
                                                      fontSize: 12.sp,
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  height: 50.h,
                                                  width: 1.sw,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: ColorManager.greyColor),
                                                      color: ColorManager.whiteColor,
                                                      borderRadius:
                                                      BorderRadius.circular(12.r)),
                                                  child: InkWell(
                                                    onTap: () {
                                                      ProductsCubit.get(context)
                                                          .pickFromGallery(context);
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: 64.h,
                                                          width: 106.w,
                                                          decoration: BoxDecoration(
                                                              color: Colors.grey[100],
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  12.r)),
                                                          child: Center(
                                                            child: Text(
                                                              'Choose File',
                                                              style: TextStyle(
                                                                  color: const Color(
                                                                      0xFF757575),
                                                                  fontWeight:
                                                                  FontWeight.w400,
                                                                  fontSize: 14.sp),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Center(
                                                            child: Text(
                                                              imag1 =ProductsCubit.get(context).image ==null?'    No File chosen':
                                                              '${ProductsCubit.get(context).image.toString().split('/data/user/0/com.example.hoga_load/cache/image_picker')}',
                                                              style: TextStyle(
                                                                  color: const Color(
                                                                      0xFF757575),
                                                                  fontWeight:
                                                                  FontWeight.w400,
                                                                  fontSize: 14.sp),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    FittedBox(
                                                      child: CustomText(
                                                        text:
                                                        'Should have a size of 925px width and 200px height',
                                                        align: TextAlign.start,
                                                        color: Colors.grey,
                                                        fontSize: 10.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8.0, horizontal: 14.w),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    CustomText(
                                                      text: 'Banner for Mobile Devices',
                                                      align: TextAlign.start,
                                                      color: Colors.grey,
                                                      fontSize: 12.sp,
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  height: 50.h,
                                                  width: 1.sw,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: ColorManager.greyColor),
                                                      color: ColorManager.whiteColor,
                                                      borderRadius:
                                                      BorderRadius.circular(12.r)),
                                                  child: InkWell(
                                                    onTap: () {
                                                      ProductsCubit.get(context)
                                                          .pickFromGallery(context);
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: 64.h,
                                                          width: 106.w,
                                                          decoration: BoxDecoration(
                                                              color: Colors.grey[100],
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  12.r)),
                                                          child: Center(
                                                            child: Text(
                                                              'Choose File',
                                                              style: TextStyle(
                                                                  color: const Color(
                                                                      0xFF757575),
                                                                  fontWeight:
                                                                  FontWeight.w400,
                                                                  fontSize: 14.sp),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Center(
                                                            child: Text(
                                                              imag2 =ProductsCubit.get(context).image1 ==null?'    No File chosen':
                                                              '${ProductsCubit.get(context).image1.toString().split('/data/user/0/com.example.hoga_load/cache/image_picker')}',
                                                              style: TextStyle(
                                                                  color: const Color(
                                                                      0xFF757575),
                                                                  fontWeight:
                                                                  FontWeight.w400,
                                                                  fontSize: 14.sp),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    FittedBox(
                                                      child: CustomText(
                                                        text:
                                                        'Should have a size of 925px width and 200px height',
                                                        align: TextAlign.start,
                                                        color: Colors.grey,
                                                        fontSize: 10.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 5.h,
                                            ),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 14.w),
                                                  child: Row(
                                                    children: [
                                                      CustomText(
                                                        text: 'Link to Redirect Users',
                                                        align: TextAlign.start,
                                                        color: Colors.grey,
                                                        fontSize: 10.sp,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                CustomTextField(
                                                  height: 50.h,
                                                  hintText:
                                                  'Please enter link with http:// or https://',
                                                  keyboardType: TextInputType.url,
                                                  controller: PackageCubit.get(context)
                                                      .linkController,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 5.h, left: 14.w),
                                            child: Container(
                                                height: 100.h,
                                                width: 1.sw,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius:
                                                    BorderRadius.circular(12.r)),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: CustomText(
                                                    align: TextAlign.start,
                                                    color: Colors.grey[800],
                                                    fontSize: 10.sp,
                                                    text:
                                                    'NOTE : Please note your advertisement will be published by admin only. If there is any communication required, our team will contact with you at ${UpdateProfileCubit.get(context).profileData.email ?? ''} and ${UpdateProfileCubit.get(context).profileData.contactNumber ?? ''}',
                                                  ),
                                                )),
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                            child: const Divider(
                                              thickness: 1,
                                            ),
                                          ),
                                          state is UploadPackageLoading?const Center(
                                            child: CircularProgressIndicator(color: Colors.orange,),
                                          )
                                              :
                                          Padding(
                                            padding:
                                            EdgeInsets.only(bottom: 15.h, top: 10.h),
                                            child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: CustomButton(
                                                text: 'UPLOAD ADVERTISEMENT',
                                                icon: Icons.add,
                                                color: ColorManager.yellow,
                                                function: () {
                                                  PackageCubit.get(context)
                                                      .uploadPackageCubit(
                                                      model: PackagesDetail(
                                                        desktopBanner: imag1,
                                                        mobileBanner: imag2,
                                                        link: PackageCubit.get(context)
                                                            .linkController
                                                            .toString(),
                                                      ));
                                                  imag1='';
                                                  imag2='';
                                                  ProductsCubit.get(context).image==null;
                                                  ProductsCubit.get(context).image1==null;
                                                  PackageCubit.get(context)
                                                      .linkController
                                                      .clear();

                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ))),
                ],
              );
            }
          );
        }
      ),
    );
  }
}
/*

 */
