import 'package:flutter/material.dart';
import 'package:hoga_load/features/home/view.dart';
import 'package:hoga_load/features/subscribtion_details/units/details.dart';
import 'package:hoga_load/features/subscribtion_details/units/facilities.dart';
import 'package:hoga_load/features/subscribtion_details/units/plans.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';

import '../../core/data/local/cacheHelper.dart';
import '../../core/keys/keys.dart';
import '../../core/widgets/custom_card.dart';
import '../../widgets/widgets/custom_notloggedin.dart';

part 'units/body.dart';

GlobalKey<ScaffoldState> subscriptionScaffoldKey = GlobalKey<ScaffoldState>();

class SubscriptionDetailsView extends StatelessWidget {
  const SubscriptionDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: subscriptionScaffoldKey,
        drawer: const OnDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppbar(
              title: 'Subscription Details',
              scaffoldKey: subscriptionScaffoldKey,
            ),
            !CacheHelper.getBool(SharedKeys.isLogin)
                ? CustomNotLoggedIn()
                : Expanded(
                    child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(), child: Body())),
          ],
        ),
      ),
    );
  }
}
