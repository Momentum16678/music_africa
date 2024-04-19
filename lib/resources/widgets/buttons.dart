import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:sound_africa/resources/managers/color_manager.dart';
import 'package:sound_africa/resources/managers/string_manager.dart';
import 'package:sound_africa/resources/managers/styles_manager.dart';
import 'package:sound_africa/resources/managers/values_manager.dart';

Widget skipButton() {
  return Container(
    padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p18, vertical: AppPadding.p8),
    decoration: const BoxDecoration(
        color: ash4Color,
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s100))),
    child: const Text(StringManager.skip, style: AppTextStyle.bodyStyle400),
  );
}

Widget loginButton() {
  return Container(
    padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p60, vertical: AppPadding.p14),
    decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s100))),
    child: Text(StringManager.signUp,
        style: AppTextStyle.bodyStyle600.copyWith(color: Colors.white)),
  );
}

Widget roundContainer(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p18, vertical: AppPadding.p8),
    decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s100)),
        border: Border.all(
          color: ash7Color,
          width: AppSize.s1,
        )),
    child: Text(
      text,
      style: AppTextStyle.bodyStyle,
    ),
  );
}

Widget gradientButton(String text, Color color, Color iconColor) {
  return Container(
    width: AppSize.s200,
    padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p18, vertical: AppPadding.p16),
    decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s100)),
        border: GradientBoxBorder(
          width: AppSize.s2,
          gradient: LinearGradient(
              begin: Alignment(0, -1),
              end: Alignment(0, 1),
              colors: [gradient1, gradient2, gradient3, gradient4, gradient5]),
        )),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppTextStyle.bodyStyle.copyWith(color: color),
        ),
        const Gap(AppSize.s10),
        Icon(
          Icons.arrow_forward,
          color: iconColor,
          size: AppSize.s20,
        ),
      ],
    ),
  );
}
