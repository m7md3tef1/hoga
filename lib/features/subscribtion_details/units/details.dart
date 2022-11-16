import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/color_manager/color_manager.dart';
import '../../../core/dialoges/delete_dialoge.dart';
import '../../../core/widgets/custom_card_title.dart';
import '../../../widgets/widgets/custom_text.dart';
import '../../dashboard/cubit/UpdateProfile_state.dart';
import '../../dashboard/cubit/updateProfile_cubit.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProfileCubit, UpdateProfileStates>(
      listener: (context, state) {},
      builder: (context, state) => Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          CustomCardTitle(
            text: 'SUBSCRIPTION DETAILS',
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: name.length,
              itemBuilder: (context, index) {

                //   print(UpdateProfileCubit.get(context).subscriptionData.userDetails!.firstName);
                List detail = [
                  '${UpdateProfileCubit.get(context).subscriptionData.userDetails == null ? 'Not Found' : UpdateProfileCubit.get(context).subscriptionData.userDetails!.firstName.toString()} ${UpdateProfileCubit.get(context).subscriptionData.userDetails == null ? 'Not Found' : UpdateProfileCubit.get(context).subscriptionData.userDetails!.lastName.toString()},',
                  (UpdateProfileCubit.get(context)
                              .subscriptionData
                              .subscriptionDetails ==
                          null
                      ? 'Not Found'
                      : UpdateProfileCubit.get(context)
                          .subscriptionData
                          .subscriptionDetails!
                          .subscriptionTakenOn
                          .toString()),
                  '${UpdateProfileCubit.get(context).subscriptionData.subscriptionDetails == null ? 'Not Found' : UpdateProfileCubit.get(context).subscriptionData.subscriptionDetails!.subscriptionTakenOn}to${UpdateProfileCubit.get(context).subscriptionData.subscriptionDetails == null ? 'Not Found' : UpdateProfileCubit.get(context).subscriptionData.subscriptionDetails!.subscriptionValidTill.toString()}',
                  (UpdateProfileCubit.get(context)
                              .subscriptionData
                              .subscriptionDetails ==
                          null
                      ? 'Not Found'
                      : UpdateProfileCubit.get(context)
                          .subscriptionData
                          .subscriptionDetails!
                          .stripeId
                          .toString()),
                  'Card Payment',
                  'xxxx-xxxx-xxxx-4242',
                  '',
                ];
                return Padding(
                  padding: EdgeInsets.only(bottom: 17.h, left: 9.w, right: 9.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CustomText(
                            text: name[index],
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF777777),
                          )
                        ],
                      ),
                      const Spacer(),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            index != 6
                                ? CustomText(
                                    align: TextAlign.end,
                                    text: detail[index],
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF777777),
                                  )
                                : state is CancelSuccess
                                    ? Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.red),
                                        child: CustomText(
                                          align: TextAlign.center,
                                          text: 'Cancelled',
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      )
                                    : Row(
                                        children: [
                                          Container(
                                            height: 20.h,
                                            width: 58.w,
                                            decoration: BoxDecoration(
                                                color:
                                                    ColorManager.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(5.r)),
                                            child: Center(
                                              child: CustomText(
                                                text: 'Active',
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w600,
                                                color: ColorManager.whiteColor,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {


                                              setState(() {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        DeleteEditDialog(
                                                          function: () async {
                                                            await UpdateProfileCubit
                                                                .get(context)
                                                                .cancelSubscriptionCubit();
                                                          },
                                                          btnText: 'Delete',
                                                        ));
                                              });
                                            },
                                            child: CustomText(
                                              text: '  Cancel?',
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFFFDC52F),
                                            ),
                                          )
                                        ],
                                      )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}

List name = [
  'Customer',
  'Created',
  'Current Period',
  'ID',
  'Billing Method',
  'Payment Method',
  'Status',
];
