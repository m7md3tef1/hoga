import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/core/router/router.dart';
import 'package:hoga_load/features/home/view.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_button.dart';
import 'package:hoga_load/widgets/widgets/custom_checkbox.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';
import 'package:hoga_load/widgets/widgets/custom_text_field.dart';

import '../../core/data/local/cacheHelper.dart';
import '../../core/data/models/card_model.dart';
import '../../core/keys/keys.dart';
import '../../core/master_cubit/getDataForm_cubit.dart';
import '../../core/master_cubit/getDataForm_state.dart';
import '../../core/widgets/custom_card.dart';
import '../auth/units/cant_login.dart';
import 'cubit/addCard_cubit.dart';

part 'units/form.dart';

class AddUpdateCardView extends StatelessWidget {
   AddUpdateCardView({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> passScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: passScaffoldKey,
        drawer: const OnDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppbar(title: 'Add / Update Card Details',scaffoldKey: passScaffoldKey,),
            CacheHelper.getBool(SharedKeys.isLogin)?NotLogged():const Expanded(
                child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.only(top: 22.0),
                      child: Form(),
                    ))),
          ],
        ),
      ),
    );
  }
}
