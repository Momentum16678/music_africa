import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sound_africa/resources/managers/color_manager.dart';
import 'package:sound_africa/resources/widgets/buttons.dart';
import 'package:sound_africa/resources/managers/image_manager.dart';
import 'package:sound_africa/resources/managers/string_manager.dart';
import 'package:sound_africa/resources/managers/styles_manager.dart';
import 'package:sound_africa/resources/managers/values_manager.dart';
import 'package:sound_africa/views/home/home_screen.dart';
import 'package:sound_africa/views/signup/bottom_modal_sheets.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ash8Color,
      body: Column(children: [
        const Gap(AppSize.s60),
        Text(
          StringManager.soundBeat,
          style: AppTextStyle.headerStyle
              .copyWith(color: ash1Color, fontSize: AppSize.s20),
        ),
        const Gap(AppSize.s20),
        const Image(
          image: NetworkImage(StringManager.pulseGif),
          width: AppSize.s100,
          height: AppSize.s100,
        ),
        Transform.scale(
          scale: 0.9,
          child: SizedBox(
            width: AppSize.s400,
            height: AppSize.s380,
            child: Center(
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.antiAlias,
                children: [
                  Positioned(
                    top: AppSize.s20,
                    left: AppSize.s75,
                    child: Image.asset(
                      ImageManager.stack2,
                      width: 205,
                      height: 200,
                    ),
                  ),
                  Positioned(
                    top: AppSize.s35,
                    left: AppSize.s55,
                    child: Image.asset(
                      ImageManager.stack1,
                      width: AppSize.s255,
                      height: AppSize.s250,
                    ),
                  ), //Container
                  Positioned(
                    top: AppSize.s50,
                    left: AppSize.s30,
                    child: Image.asset(
                      ImageManager.onboard1,
                      width: AppSize.s305,
                      height: AppSize.s280,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
            onTap: () {
              showSignUpBottomSheet(context: context);
            },
            child: loginButton()),
        const Gap(AppSize.s20),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          child: Text(
            StringManager.signIn,
            style: AppTextStyle.bodyStyle600.copyWith(color: blueColor),
          ),
        ),
      ]),
    );
  }
}
