import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sound_africa/resources/managers/color_manager.dart';
import 'package:sound_africa/resources/managers/image_manager.dart';
import 'package:sound_africa/resources/managers/string_manager.dart';
import 'package:sound_africa/resources/managers/styles_manager.dart';
import 'package:sound_africa/resources/managers/values_manager.dart';
import 'package:sound_africa/resources/widgets/buttons.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

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
      const Text(StringManager.explore, style: AppTextStyle.headerStyle),
      const Text(StringManager.africanBeats, style: AppTextStyle.headerStyle),
      const Text(StringManager.andSounds, style: AppTextStyle.headerStyle),
      const Gap(AppSize.s20),
      Image.asset(
        ImageManager.onboard1,
        width: AppSize.s235,
        height: AppSize.s230,
      ),
      const Gap(AppSize.s40),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          roundContainer(StringManager.afroBeats),
          const Gap(AppSize.s10),
          roundContainer(StringManager.amapiano),
        ],
      ),
    ]);
  }
}
