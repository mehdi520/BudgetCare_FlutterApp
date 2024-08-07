
import 'package:flutter/material.dart';

import '../../../core/core_exports.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {

  const BasicAppBar({
    super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.white),
      title: Center(
        child: Image.asset(
          AppImages.splashlogo,
          height: 40,
          color: AppColors.white,
        ),
      ),
      actions: [

        SizedBox(
          width: 50,
        )
      ],
    );
  }

  @override
  Size get preferredSize  => const Size.fromHeight(kToolbarHeight);
}
