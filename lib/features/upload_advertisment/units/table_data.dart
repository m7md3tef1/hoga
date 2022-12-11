import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/features/packages/cubit/package_cubit.dart';
import 'package:hoga_load/features/packages/cubit/package_states.dart';
import 'package:hoga_load/features/search_product/cubit/getProduct_cubit.dart';
import 'package:hoga_load/features/upload_advertisment/units/table_product_title.dart';
import 'package:hoga_load/features/upload_product/add_view.dart';
import 'package:hoga_load/features/upload_product/units/table_product_title.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/color_manager/color_manager.dart';
import '../../../core/dialoges/delete_dialoge.dart';
import '../../../core/router/router.dart';
import '../../../widgets/widgets/custom_text.dart';
import '../../search_product/cubit/getProduct__states.dart';

class MyAdvertismentTable extends StatelessWidget {
  const MyAdvertismentTable({super.key});

  @override
  Widget build(BuildContext context) {
    return UploadedTableAdvertisment(
        child: BlocConsumer<PackageCubit, PackageStates>(
            listener: (BuildContext context, Object? state) {},
            builder: (context, state) {
              if (state is GetPackageLoading) {
                return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        color: index.isEven ? Colors.grey[300] : Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: InkWell(
                            onTap: () {},
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Shimmer.fromColors(
                                    enabled: true,
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[400]!,
                                    child: Container(
                                        width: 0.2.sw,
                                        height: 12.sp,
                                        color: Colors.grey[300]),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Shimmer.fromColors(
                                      enabled: true,
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[400]!,
                                      child: Container(
                                          width: 0.2.sw,
                                          height: 12.sp,
                                          color: Colors.grey[300])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Shimmer.fromColors(
                                      enabled: true,
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[400]!,
                                      child: Container(
                                          width: 0.2.sw,
                                          height: 12.sp,
                                          color: Colors.grey[300])),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: PackageCubit.get(context).getPackageList.length,
                    itemBuilder: (context, index) {
                      {
                        var package = PackageCubit.get(context).getPackageList;
                        return Container(
                          color:  Colors.white,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: CustomText(
                                        text: '${index + 1}',
                                        align: TextAlign.start,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: CustomText(
                                        text: package[index].startDate == null
                                            ? 'other'
                                            : package[index]
                                                .startDate
                                                .toString(),
                                        align: TextAlign.start,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: CustomText(
                                        text: package[index].endDate == null
                                            ? 'other'
                                            : package[index].endDate.toString(),
                                        align: TextAlign.start,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 12.h,
                                child: const Divider(
                                  thickness: 1,
                                ),
                              )
                            ],
                          ),
                        );
                      }
                    });
              }
            }));
  }
}
