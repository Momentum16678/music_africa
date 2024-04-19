import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sound_africa/resources/managers/image_manager.dart';
import 'package:sound_africa/resources/managers/string_manager.dart';
import 'package:sound_africa/resources/managers/styles_manager.dart';
import 'package:sound_africa/resources/managers/values_manager.dart';
import 'package:sound_africa/views/home/image_screen.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  final List<String> images = [
    ImageManager.beats,
    ImageManager.beats,
  ];

  final List<String> images1 = [
    ImageManager.onboard1,
    ImageManager.onboard1,
    ImageManager.onboard1,
    ImageManager.onboard1,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: AppSize.s0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(StringManager.sarzHappiness,
                style: AppTextStyle.bodyStyle.copyWith(fontSize: AppSize.s14)),
            GestureDetector(
                onTap: () {},
                child: Image.asset(
                  ImageManager.more,
                  width: AppSize.s20,
                  height: AppSize.s20,
                )),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
          child: Column(
            children: [
              const Gap(AppSize.s40),
              Image.asset(
                ImageManager.profilePlate,
                width: AppSize.s80,
                height: AppSize.s25,
              ),
              const Gap(AppSize.s20),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ImageScreen()),
                    );
                  },
                  child: Image.asset(
                    ImageManager.artist,
                    width: AppSize.s290,
                    height: AppSize.s300,
                  )),
              const Gap(AppSize.s20),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: AppSize.s0)),
                child: Slider(
                    min: AppSize.s0,
                    max: AppSize.s100,
                    activeColor: Colors.black,
                    value: AppSize.s40,
                    onChanged: (value) {}),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
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
                  ),
                  const Gap(AppSize.s10),
                  Image.asset(
                    ImageManager.play,
                    width: AppSize.s50,
                    height: AppSize.s50,
                  ),
                  const Gap(AppSize.s10),
                  Image.asset(
                    ImageManager.forward,
                    width: AppSize.s25,
                    height: AppSize.s18,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
