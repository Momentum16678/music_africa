import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sound_africa/resources/data/data.dart';
import 'package:sound_africa/resources/managers/color_manager.dart';
import 'package:sound_africa/resources/managers/image_manager.dart';
import 'package:sound_africa/resources/managers/string_manager.dart';
import 'package:sound_africa/resources/managers/styles_manager.dart';
import 'package:sound_africa/resources/managers/values_manager.dart';
import 'package:sound_africa/resources/widgets/buttons.dart';
import 'package:sound_africa/resources/widgets/custom_textfield.dart';
import 'package:sound_africa/views/home/modal_sheets/bottom_modal_sheet.dart';
import 'package:sound_africa/views/home/play_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<dynamic> banks;
  String selectedBankCode = '';
  String accountNumber = '';
  String userName = '';

  @override
  void initState() {
    super.initState();
    fetchBanks();
  }

  Future<void> fetchBanks() async {
    final response = await http
        .get(Uri.parse('https://api.paystack.co/bank?country=nigeria'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        banks = data['data'];
      });
    } else {
      throw Exception('Failed to load banks');
    }
  }

  Future<void> verifyAccount() async {
    final response = await http.post(
      Uri.parse('https://verifyaccountnumber-7l2bkb353q-uc.a.run.app'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
          {'account_number': accountNumber, 'bank_code': selectedBankCode}),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        userName = data['name'];
      });
    } else {
      throw Exception('Failed to verify account');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: AppSize.s0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(StringManager.topOfSound,
                style: AppTextStyle.bodyStyle.copyWith(fontSize: AppSize.s14)),
            GestureDetector(
                onTap: () {
                  showSearchBottomSheet(context: context);
                },
                child: Image.asset(
                  ImageManager.search,
                  width: AppSize.s20,
                  height: AppSize.s20,
                )),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(AppSize.s10),
              const Text(
                StringManager.topBeats,
                style: AppTextStyle.headerMediumStyle,
              ),
              const Gap(AppSize.s10),
              Text(
                StringManager.discover,
                style: AppTextStyle.bodyStyle.copyWith(color: ash11Color),
              ),
              const Gap(AppSize.s10),
              SizedBox(
                height: AppSize.s230,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PlayScreen()),
                          );
                        },
                        child: Image.asset(
                          images[index],
                          width: AppSize.s235,
                          height: AppSize.s230,
                          fit: BoxFit.cover, // Adjust image fit as needed
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Gap(AppSize.s20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Text(
                        StringManager.newDrops,
                        style: AppTextStyle.headerMediumStyle,
                      ),
                      const Gap(AppSize.s10),
                      Text(
                        StringManager.december,
                        style:
                            AppTextStyle.bodyStyle.copyWith(color: ash11Color),
                      ),
                    ],
                  ),
                  const Text(
                    StringManager.feelIt,
                    style: AppTextStyle.bodyStyleItalic,
                  ),
                ],
              ),
              const Gap(AppSize.s10),
              GestureDetector(
                onTap: () {
                  showStreamingBottomSheet(context: context);
                },
                child: SizedBox(
                  height: AppSize.s150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images1.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p5),
                        child: Image.asset(
                          images1[index],
                          width: AppSize.s150,
                          height: AppSize.s150,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Gap(AppSize.s40),
              const Padding(
                padding: EdgeInsets.only(left: AppPadding.p40),
                child: Text(StringManager.exploreCaves,
                    style: AppTextStyle.bodyStyle),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: AppPadding.p50),
                  child: Text(
                    StringManager.makeMusic,
                    style: AppTextStyle.bodyStyle.copyWith(color: ash11Color),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: AppPadding.p20),
                child: Image.asset(
                  ImageManager.profilePlate,
                  width: AppSize.s80,
                  height: AppSize.s25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showAddAccountBottomSheet({
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
                  CustomTextField(
                    hintText: StringManager.selectBank,
                    hintStyle:
                        AppTextStyle.bodyStyle400.copyWith(color: Colors.white),
                    style: AppTextStyle.bodyStyle.copyWith(color: Colors.white),
                    borderRadius: BorderRadius.circular(AppSize.s100),
                    focusedBorderColor: Colors.white,
                    enabledBorderColor: Colors.white,
                    suffixIcon: GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        )),
                    borderWidth: 10.0,
                  ),
                  const Gap(AppSize.s10),
                  CustomTextField(
                    hintText: StringManager.accountNumber,
                    hintStyle:
                        AppTextStyle.bodyStyle400.copyWith(color: Colors.white),
                    style: AppTextStyle.bodyStyle.copyWith(color: Colors.white),
                    focusedBorderColor: Colors.white,
                    enabledBorderColor: Colors.white,
                    borderRadius: BorderRadius.circular(AppSize.s100),
                    borderWidth: 10.0,
                  ),
                  const Gap(AppSize.s50),
                  Center(
                    child: GestureDetector(
                        onTap: () {
                          showAccountAddedBottomSheet(context: context);
                        },
                        child: gradientButton(StringManager.verifyAccount,
                            Colors.white, Colors.white)),
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
