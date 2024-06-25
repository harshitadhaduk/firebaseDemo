import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';

class AppTextStyle {
  var kTextStyleWithFont = GoogleFonts.montserrat();
  var kTextStyleFourteenWithThemeColor = GoogleFonts.montserrat(
    fontSize: 14,
    color: AppColor().kPrimaryTextColor,
  );
  var kTextStyleTwelveWithGreyColor = GoogleFonts.montserrat(
    fontSize: 12,
    color: AppColor().kSecondaryTextColor,
  );
}
