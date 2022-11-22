import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/app_images/app_images.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/features/change_password/cubit/changePass_state.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/data/local/cacheHelper.dart';
import '../../core/data/models/ChangePass_model.dart';
import '../../core/keys/keys.dart';
import '../../core/validator/validator.dart';
import '../about/units/small_container.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';
import 'package:hoga_load/widgets/widgets/custom_text_field.dart';

import '../home/view.dart';
import 'cubit/changePass_cubit.dart';
part 'units/form.dart';
class ChangePassView extends StatelessWidget {
   ChangePassView({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> passScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const OnDrawer(),
        key: passScaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppbar(title: 'Change Password',scaffoldKey: passScaffoldKey,),
              SizedBox(height: 22.h,),
               Padding(
                 padding: const EdgeInsets.all(20),
                 child: form(),
               ),

            ],
          ),
        ),
      ),
    );
  }
}
