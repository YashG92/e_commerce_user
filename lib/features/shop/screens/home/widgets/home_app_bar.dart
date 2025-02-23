import 'package:e_commerce_user/features/personaliztion/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return CustomAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Good day for shopping', style: Theme.of(context).textTheme.labelMedium!.apply(color: AColors.grey),),
          Obx(() {
            if(controller.profileLoading.value){
              return CircularProgressIndicator();
            }else{
              return Text(controller.user.value.fullName,style: Theme.of(context).textTheme.headlineSmall!.apply(color: AColors.white),);
            }
          }),
        ],
      ),
    );
  }
}
