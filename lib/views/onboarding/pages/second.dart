import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sound_africa/resources/managers/color_manager.dart';
import 'package:sound_africa/resources/managers/image_manager.dart';
import 'package:sound_africa/resources/managers/string_manager.dart';
import 'package:sound_africa/resources/managers/styles_manager.dart';
import 'package:sound_africa/resources/managers/values_manager.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Gap(AppSize.s60),
      Text(
        StringManager.soundBeat,
        style: AppTextStyle.headerStyle
            .copyWith(color: ash1Color, fontSize: AppSize.s20),
      ),
      const Gap(AppSize.s20),
      Text(StringManager.theGreatest,
          style: AppTextStyle.headerStyle.copyWith(color: ash6Color)),
      RichText(
        text: TextSpan(children: [
          TextSpan(
              text: StringManager.sound,
              style: AppTextStyle.headerStyle.copyWith(color: ash6Color)),
          const TextSpan(
              text: StringManager.toThe, style: AppTextStyle.headerStyle)
        ]),
      ),
      const Text(StringManager.latestHit, style: AppTextStyle.headerStyle),
      const Gap(AppSize.s20),
      Image.asset(
        ImageManager.samplePlay,
        width: AppSize.s235,
        height: AppSize.s50,
      ),
      const Gap(AppSize.s20),
      Image.asset(
        ImageManager.onboard2,
        width: AppSize.s235,
        height: AppSize.s230,
      ),
      const Gap(AppSize.s65),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            StringManager.exploreSounds,
            style: AppTextStyle.bodyStyle,
          ),
          const Gap(AppSize.s10),
          Image.asset(
            ImageManager.plus,
            width: AppSize.s20,
            height: AppSize.s20,
          ),
        ],
      )
    ]);
  }
}
