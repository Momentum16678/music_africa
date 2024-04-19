import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sound_africa/resources/managers/color_manager.dart';
import 'package:sound_africa/resources/managers/image_manager.dart';
import 'package:sound_africa/resources/managers/string_manager.dart';
import 'package:sound_africa/resources/managers/styles_manager.dart';
import 'package:sound_africa/resources/managers/values_manager.dart';
import 'package:sound_africa/resources/widgets/buttons.dart';
import 'package:sound_africa/resources/widgets/custom_textfield.dart';
import 'package:sound_africa/views/home/home_screen.dart';

showStreamingBottomSheet({
  required BuildContext context,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.black,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.s30),
            topRight: Radius.circular(AppSize.s30))),
    builder: (context) {
      return SlideTransition(
        position: Tween(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: ModalRoute.of(context)!.animation!,
          curve: Curves.easeOut,
        )),
        child: SizedBox(
          height: deviceHeight(context) * 0.65,
          width: deviceWidth(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p30, vertical: AppPadding.p15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(StringManager.earnFromStreaming,
                          style: AppTextStyle.bodyStyle600.copyWith(
                              fontSize: AppSize.s14, color: Colors.white)),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: ash9Color,
                            size: AppSize.s20,
                          ))
                    ],
                  ),
                  const Gap(AppSize.s100),
                  Padding(
                    padding: const EdgeInsets.only(right: AppPadding.p70),
                    child: Center(
                      child: Transform.scale(
                        scale: 6,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Transform.translate(
                                  offset: const Offset(4.0, -10.0),
                                  child: Transform.scale(
                                    scale: 0.4,
                                    child: Text(
                                      StringManager.hash,
                                      style: AppTextStyle.bodyStyle.copyWith(
                                          fontSize: 10, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: StringManager.zero,
                                style: AppTextStyle.bodyStyle400.copyWith(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(AppSize.s80),
                  Center(
                    child: Column(
                      children: [
                        Text(StringManager.earnWhile,
                            style: AppTextStyle.headerStyle
                                .copyWith(color: Colors.white)),
                        Text(StringManager.youStream,
                            style: AppTextStyle.headerStyle
                                .copyWith(color: Colors.white)),
                        const Gap(AppSize.s50),
                        GestureDetector(
                            onTap: () {
                              showAddAccountBottomSheet(context: context);
                            },
                            child: gradientButton(StringManager.addBankAccount,
                                Colors.white, Colors.white))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

showAccountAddedBottomSheet({
  required BuildContext context,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.black,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.s30),
            topRight: Radius.circular(AppSize.s30))),
    builder: (context) {
      return SlideTransition(
        position: Tween(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: ModalRoute.of(context)!.animation!,
          curve: Curves.easeOut,
        )),
        child: SizedBox(
          height: deviceHeight(context) * 0.65,
          width: deviceWidth(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p30, vertical: AppPadding.p15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(StringManager.addBankAccount,
                          style: AppTextStyle.bodyStyle600.copyWith(
                              fontSize: AppSize.s14, color: Colors.white)),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: ash9Color,
                            size: AppSize.s20,
                          ))
                    ],
                  ),
                  const Gap(AppSize.s50),
                  Center(
                      child: Column(
                    children: [
                      Image.asset(
                        ImageManager.badge,
                        width: AppSize.s60,
                        height: AppSize.s60,
                      ),
                      Text(StringManager.accountAdded,
                          style: AppTextStyle.bodyStyle600.copyWith(
                              fontSize: AppSize.s14, color: Colors.white)),
                    ],
                  )),
                  const Gap(AppSize.s50),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    },
                    child: Container(
                      height: AppSize.s80,
                      decoration: BoxDecoration(
                          color: black1,
                          borderRadius: BorderRadius.circular(AppSize.s12)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p20, vertical: AppPadding.p10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(StringManager.accountName,
                              style: AppTextStyle.bodyStyle600.copyWith(
                                  fontSize: AppSize.s12, color: Colors.white)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(StringManager.number,
                                  style: AppTextStyle.bodyStyle600.copyWith(
                                      fontSize: AppSize.s12,
                                      color: Colors.white)),
                              const Gap(AppSize.s20),
                              Text(StringManager.access,
                                  style: AppTextStyle.bodyStyle600.copyWith(
                                      fontSize: AppSize.s12,
                                      color: Colors.white)),
                              const Gap(AppSize.s10),
                              Image.asset(
                                ImageManager.badge,
                                width: AppSize.s12,
                                height: AppSize.s12,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

showSearchBottomSheet({
  required BuildContext context,
}) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSize.s30),
              topRight: Radius.circular(AppSize.s30))),
      builder: (context) {
        return SingleChildScrollView(
          child: SizedBox(
              height: deviceHeight(context) * 0.65,
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p30, vertical: AppPadding.p15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextField(
                            borderRadius: BorderRadius.circular(AppSize.s100),
                            hintText: StringManager.nameSoundType,
                            suffixIcon: GestureDetector(
                              onTap: () {},
                              child: Transform.scale(
                                  scale: 0.5,
                                  child: Image.asset(
                                    ImageManager.search,
                                    width: AppSize.s20,
                                    height: AppSize.s20,
                                  )),
                            )),
                        const Gap(AppSize.s50),
                        const Text(StringManager.topBeats,
                            style: AppTextStyle.headerMediumStyle),
                        const Gap(AppSize.s50),
                        Image.asset(ImageManager.library,
                            width: AppSize.s60,
                            height: AppSize.s60,
                            color: textColor),
                      ]))),
        );
      });
}
