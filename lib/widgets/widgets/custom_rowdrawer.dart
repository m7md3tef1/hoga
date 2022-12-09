import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';

import '../../core/router/router.dart';
import '../../features/home/view.dart';

class CustomRowDrawer extends StatelessWidget {
  CustomRowDrawer(
      {Key? key,
      required this.text,
      this.beforeNavigate,
      this.icon,
      this.isHome = false,
      this.navigatename})
      : super(key: key);
  String text;
  Function? beforeNavigate;
  bool isHome = false;
  var icon;
  var navigatename;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (isHome) {
            Home.scaffoldStateKey.currentState!.closeDrawer();
          }
          if (beforeNavigate != null) {
            beforeNavigate!();
          }
          MagicRouter.navigateAndReplacement(navigatename);
        },
        child: Row(
          children: [
            icon == null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      height: 30.h,
                      width: 25.w,
                      image: const AssetImage(
                        'assets/images/blog.png',
                      ),
                      color: ColorManager.yellow,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      icon,
                      color: ColorManager.yellow,
                    ),
                  ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
