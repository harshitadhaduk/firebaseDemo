import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../ReactiveStateManageMent/Controller/class.dart';

class AppColor {
  var bottomFooterGradient = GetStorage().read(GetStorageKey.is_dark_mode)
      ? [
          Colors.lightBlue,
          Colors.lightBlue.shade100,
        ]
      : [
          const Color(0xff6200EE),
          Colors.deepPurple.shade300,
        ];
  var kPrimaryTextColor = GetStorage().read(GetStorageKey.is_dark_mode)
      ? const Color(0xBBFFFFFF)
      : const Color(0xDD000000);

  var kSecondaryTextColor = GetStorage().read(GetStorageKey.is_dark_mode)
      ? const Color(0x89FFFFFF)
      : const Color(0x89000000);

  Color kBlackColor = Colors.black;
}
