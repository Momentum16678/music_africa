import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sound_africa/resources/managers/color_manager.dart';
import 'package:sound_africa/resources/managers/image_manager.dart';
import 'package:sound_africa/resources/managers/string_manager.dart';
import 'package:sound_africa/resources/managers/styles_manager.dart';
import 'package:sound_africa/resources/managers/values_manager.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: deviceHeight(context),
          width: deviceWidth(context),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageManager.imageBackGround),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
            child: Column(
              children: [
                const Gap(AppSize.s40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: AppSize.s20,
                          color: Colors.white,
                        )),
                    GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          ImageManager.more,
                          width: AppSize.s20,
                          height: AppSize.s20,
                          color: Colors.white,
                        )),
                  ],
                ),
                const Gap(AppSize.s300),
                Text(StringManager.sarzHappiness,
                    style:
                        AppTextStyle.headerStyle.copyWith(color: Colors.white)),
                const Gap(AppSize.s20),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: AppSize.s0)),
                  child: Slider(
                      min: AppSize.s0,
                      max: AppSize.s100,
                      activeColor: Colors.white,
                      inactiveColor: ash12Color,
                      value: AppSize.s40,
                      onChanged: (value) {}),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(StringManager.s_33,
                          style: AppTextStyle.bodyStyle
                              .copyWith(fontSize: AppSize.s10)),
                      Text(StringManager.s_23,
                          style: AppTextStyle.bodyStyle
                              .copyWith(fontSize: AppSize.s10))
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageManager.rewind,
                      width: AppSize.s25,
                      height: AppSize.s18,
                      color: Colors.white,
                    ),
                    const Gap(AppSize.s10),
                    Image.asset(ImageManager.play,
                        width: AppSize.s50,
                        height: AppSize.s50,
                        color: Colors.white),
                    const Gap(AppSize.s10),
                    Image.asset(ImageManager.forward,
                        width: AppSize.s25,
                        height: AppSize.s18,
                        color: Colors.white),
                  ],
                ),
                const Gap(AppSize.s40),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(ImageManager.library,
                      width: AppSize.s30,
                      height: AppSize.s30,
                      color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
