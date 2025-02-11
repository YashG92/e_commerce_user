import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_user/common/widgets/images/circular_image.dart';
import 'package:e_commerce_user/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_user/features/personaliztion/screens/profile/widgets/profile_menu.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Text('Profile', style: Theme.of(context).textTheme.headlineMedium,),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///profile picture Change Section

              CircularImage(image: ImageStrings.user,width: 80,height: 80,),
              TextButton(onPressed: (){}, child: Text('Change Profile Picture')),
              SizedBox(height: TSizes.spaceBtwItems/2,),
              Divider(),



              ///Profile Information

              SizedBox(height: TSizes.spaceBtwItems,),
              SectionHeading(title:'Profile Information',showActionButton: false,),
              SizedBox(height: TSizes.spaceBtwItems,),
              Profile_Menu(title: 'Name',value: 'Varis Kadri', onPressed: () {},),
              Profile_Menu(title: 'UserName',value: 'Varis_kadri92', onPressed: () {},),
              Divider(),



              ///Personal Information Section

              SizedBox(height: TSizes.spaceBtwItems,),
              SectionHeading(title: 'Personal Information',showActionButton: false,),
              SizedBox(height: TSizes.spaceBtwItems,),
              Profile_Menu(title: 'User ID',value: '55468',icon: Iconsax.copy, onPressed: () {},),
              Profile_Menu(title: 'E-mail',value: 'dzire192@gmail.com', onPressed: () {},),
              Profile_Menu(title: 'Phone Number',value: '9574510891', onPressed: () {},),
              Profile_Menu(title: 'Gender',value: 'Male', onPressed: () {},),
              Profile_Menu(title: 'Date of Birth',value: '09-12-2002', onPressed: () {},),
              Divider(),


              ///Delete Accountf
              TextButton(onPressed: (){}, child: Text('Delete Account',style: TextStyle(color: Colors.red),))
            ],
          ),
        ),
        ),
      ),
    );
  }
}


