import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../general/app_color.dart';
import '../../general/app_text_style.dart';

class ThemeScreen extends GetView<ThemeController> {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ThemeController());
    return ThemeSwitchingArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          actions: [
            ThemeSwitcher(
              builder: (context) => Obx(
                () => IconButton(
                  onPressed: () {
                    controller.changeTheme(context);
                  },
                  icon: controller.isDarkMode.value
                      ? const Icon(CupertinoIcons.brightness)
                      : Icon(
                          CupertinoIcons.moon_stars,
                          color: AppColor().kBlackColor,
                        ),
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 150,
                      width: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 70),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage("assets/Images/trees.webp"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    buildText(
                        data: "Enter Mobile Number To Register/Login",
                        textStyle:
                            AppTextStyle().kTextStyleFourteenWithThemeColor),
                    const SizedBox(height: 20),
                    Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          buildTextFormField(),
                          const SizedBox(height: 16),
                          buildElevatedButton(context),
                          const SizedBox(height: 10),
                          buildText(
                            data:
                                "We Will send OTP message for unregistered number",
                            textStyle:
                                AppTextStyle().kTextStyleTwelveWithGreyColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ClipPath(
                clipper: FooterWaveClipper(),
                child: Container(
                  height: Get.height / 3,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: AppColor().bottomFooterGradient,
                      begin: Alignment.center,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildText({required String data, required TextStyle textStyle}) {
    return Text(
      data,
      style: textStyle,
      textAlign: TextAlign.center,
    );
  }

  Widget buildTextFormField() {
    return TextFormField(
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (value) {
        controller.validateAndCheckMobileNumber(value);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller.mobileNoController,
      style: AppTextStyle().kTextStyleWithFont,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: "Mobile Number",
        helperStyle: AppTextStyle().kTextStyleWithFont,
        labelText: "Mobile NUmber",
        labelStyle: AppTextStyle().kTextStyleWithFont,
        prefixIcon: const Icon(Icons.phone),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        isDense: true,
        errorStyle: AppTextStyle().kTextStyleWithFont,
      ),
      maxLength: 10,
      validator: (value) {
        controller.validateMobile(value!);
        return null;
      },
    );
  }

  Widget buildElevatedButton(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: context.width),
      child: ElevatedButton(
        onPressed: () {
          controller
              .validateAndCheckMobileNumber(controller.mobileNoController.text);
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 10,
          padding: const EdgeInsets.all(14),
        ),
        child: Text(
          "Continue",
          style: AppTextStyle().kTextStyleWithFont,
        ),
      ),
    );
  }
}

class FooterWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height - 60);
    // var secondControlPoint = Offset(size.width - (size.width / 6), size.height);
    // var secondEndPoint = Offset(size.width, 0.0);
    // path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
    //     secondEndPoint.dx, secondEndPoint.dy);
    path.quadraticBezierTo(
        size.width - (size.width / 6), size.height, size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
