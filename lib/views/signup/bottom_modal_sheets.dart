import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:gap/gap.dart';
import 'package:sound_africa/resources/managers/color_manager.dart';
import 'package:sound_africa/resources/managers/image_manager.dart';
import 'package:sound_africa/resources/managers/string_manager.dart';
import 'package:sound_africa/resources/managers/styles_manager.dart';
import 'package:sound_africa/resources/managers/values_manager.dart';
import 'package:sound_africa/resources/widgets/buttons.dart';
import 'package:sound_africa/resources/widgets/custom_textfield.dart';
import 'package:sound_africa/resources/widgets/signup_textfield.dart';
import 'package:sound_africa/views/home/home_screen.dart';

showSignUpBottomSheet({
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(StringManager.signupWithPhone,
                                style: AppTextStyle.bodyStyle600
                                    .copyWith(fontSize: AppSize.s14)),
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
                        Text(StringManager.phoneNumber.toUpperCase(),
                            style: AppTextStyle.bodyStyle600
                                .copyWith(fontSize: AppSize.s10)),
                        const Gap(AppSize.s10),
                        signUpTextField(),
                        const Gap(AppSize.s10),
                        const Text(StringManager.otpText,
                            style: AppTextStyle.bodyStyle400),
                        const Gap(AppSize.s65),
                        GestureDetector(
                            onTap: () {
                              showOtpBottomSheet(context: context);
                            },
                            child: Center(
                                child: gradientButton(StringManager.verifyPhone,
                                    textColor, textColor)))
                      ]))),
        );
      });
}

showOtpBottomSheet({required BuildContext context}) {
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
                      horizontal: AppPadding.p20, vertical: AppPadding.p15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppPadding.p10),
                              child: Text(StringManager.signupWithPhone,
                                  style: AppTextStyle.bodyStyle600
                                      .copyWith(fontSize: AppSize.s14)),
                            ),
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
                        const Gap(AppSize.s30),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p10),
                          child: Text(
                              StringManager.enterOneTimePassword.toUpperCase(),
                              style: AppTextStyle.bodyStyle600
                                  .copyWith(fontSize: AppSize.s8)),
                        ),
                        const Gap(AppSize.s10),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: AppPadding.p10),
                          child: Text(StringManager.oneTimeBody,
                              style: AppTextStyle.bodyStyle400),
                        ),
                        const Gap(AppSize.s10),
                        PinCodeFields(
                          length: 6,
                          fieldBorderStyle: FieldBorderStyle.square,
                          responsive: false,
                          fieldHeight: AppSize.s60,
                          fieldWidth: AppSize.s42,
                          borderWidth: AppSize.s1,
                          margin: EdgeInsets.zero,
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p15),
                          activeBorderColor: ash10Color,
                          borderRadius: BorderRadius.circular(AppSize.s12),
                          keyboardType: TextInputType.number,
                          autoHideKeyboard: false,
                          fieldBackgroundColor: Colors.transparent,
                          borderColor: ash10Color,
                          textStyle: AppTextStyle.bodyStyle,
                          onComplete: (output) {},
                        ),
                        const Gap(AppSize.s10),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(StringManager.resend,
                                      style: AppTextStyle.bodyStyle500
                                          .copyWith(color: blueColor)),
                                  const Gap(AppSize.s10),
                                  Image.asset(
                                    ImageManager.undo,
                                    width: AppSize.s20,
                                    height: AppSize.s20,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(StringManager.changePhone,
                                      style: AppTextStyle.bodyStyle500
                                          .copyWith(color: blueColor)),
                                  const Gap(AppSize.s10),
                                  Image.asset(
                                    ImageManager.undo,
                                    width: AppSize.s20,
                                    height: AppSize.s20,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const Gap(AppSize.s65),
                        GestureDetector(
                            onTap: () {
                              showPaymentVerifiedBottomSheet(context: context);
                            },
                            child: Center(
                                child: gradientButton(StringManager.validateOtp,
                                    textColor, textColor)))
                      ]))),
        );
      });
}

showPaymentVerifiedBottomSheet({required BuildContext context}) {
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppPadding.p10),
                              child: Text(StringManager.signupWithPhone,
                                  style: AppTextStyle.bodyStyle600
                                      .copyWith(fontSize: AppSize.s14)),
                            ),
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
                        GestureDetector(
                          onTap: () {
                            showCompleteAccountBottomSheet(context: context);
                          },
                          child: Center(
                            child: Column(
                              children: [
                                const Gap(AppSize.s65),
                                Image.asset(
                                  ImageManager.verified,
                                  width: AppSize.s120,
                                  height: AppSize.s120,
                                ),
                                const Gap(AppSize.s20),
                                Text(StringManager.phoneVerified,
                                    style: AppTextStyle.bodyStyle600
                                        .copyWith(fontSize: AppSize.s14)),
                              ],
                            ),
                          ),
                        )
                      ]))),
        );
      });
}

showCompleteAccountBottomSheet({required BuildContext context}) {
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(StringManager.completeAccount,
                            style: AppTextStyle.bodyStyle600
                                .copyWith(fontSize: AppSize.s14)),
                        const Gap(AppSize.s40),
                        Text(StringManager.setupPassword,
                            style: AppTextStyle.bodyStyle600
                                .copyWith(fontSize: AppSize.s14)),
                        const Gap(AppSize.s10),
                        Text(StringManager.password,
                            style: AppTextStyle.bodyStyle600
                                .copyWith(fontSize: AppSize.s14)),
                        const Gap(AppSize.s10),
                        CustomTextField(
                          hintText: StringManager.password,
                          borderColor: ash10Color,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty!";
                            }
                            return null;
                          },
                        ),
                        Text(StringManager.confirmPassword,
                            style: AppTextStyle.bodyStyle600
                                .copyWith(fontSize: AppSize.s14)),
                        const Gap(AppSize.s10),
                        CustomTextField(
                          hintText: StringManager.password,
                          borderColor: ash10Color,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty!";
                            }
                            return null;
                          },
                        ),
                        const Gap(AppSize.s40),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()),
                              );
                            },
                            child: Center(
                                child: gradientButton(StringManager.complete,
                                    textColor, textColor)))
                      ]))),
        );
      });
}
