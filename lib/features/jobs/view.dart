import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/features/jobs/cubit/getJop_cubit.dart';
import 'package:hoga_load/features/jobs/cubit/getJop_states.dart';
import 'package:hoga_load/features/jobs/units/details.dart';
import 'package:hoga_load/features/jobs/upload_jop/add_view.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_row.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/router/router.dart';

part 'units/body.dart';

class JobsView extends StatefulWidget {
   JobsView({Key? key}) : super(key: key);

  @override
  State<JobsView> createState() => _JobsViewState();
}

class _JobsViewState extends State<JobsView> {
 @override
 void initState() {
   // TODO: implement initState
   super.initState();
   JopCubit.get(context).page=1;

 }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body:
      Container(
        child: RefreshIndicator(
          color: Colors.orange,
          backgroundColor: Colors.white,
          onRefresh: ()async{
            print('refresh');
            await JopCubit.get(context).getPage();
            print("page is "+'${JopCubit.get(context).page}');
          await JopCubit.get(context).getJops(page:JopCubit.get(context).page,isFilter: false );
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomAppbar(title: 'Jobs'),
                SizedBox(
                  height: 22.h,
                ),
                CustomSearchRow(
                  4,
                  function: () {
                    MagicRouter.navigateTo(AddJopView(
                      isFilter: true,
                    ));
                  },
                ),
                SizedBox(
                  height: 21.h,
                ),
                Body()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
