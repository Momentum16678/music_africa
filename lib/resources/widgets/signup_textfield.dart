import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sound_africa/resources/managers/color_manager.dart';
import 'package:sound_africa/resources/managers/string_manager.dart';
import 'package:sound_africa/resources/managers/styles_manager.dart';
import 'package:sound_africa/resources/managers/values_manager.dart';

Widget signUpTextField() {
  return Container(
    width: double.infinity,
    height: AppSize.s50,
    decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10)),
        border: Border.all(
          color: ash10Color,
          width: AppSize.s1,
        )),
    child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.s10),
        child: Text(
          StringManager.countryCode,
          style: AppTextStyle.bodyStyle500,
        ),
      ),
      SizedBox(
        height: AppSize.s50,
        width: AppSize.s200,
        child: Padding(
          padding: const EdgeInsets.only(bottom: AppSize.s10),
          child: TextFormField(
            keyboardType: TextInputType.number, // Set keyboard type to number
            inputFormatters: [LengthLimitingTextInputFormatter(10)],
            textInputAction: TextInputAction.done,
            style: AppTextStyle.bodyStyle500,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      )
    ]),
  );
}
