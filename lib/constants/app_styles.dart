import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safety_app/constants/app_theme.dart';

const double kBorderRadius20 = 20.0;
const double kBorderRadius10 = 10.0;
const double kBorderRadius5 = 5.0;



const double kPadding32 = 32.0;
const double kPadding24 = 24.0;
const double kPadding20 = 20.0;
const double kPadding16 = 16.0;
const double kPadding8 = 8.0;
const double kPadding4 = 4.0;


final kInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(kBorderRadius10),
  borderSide: const BorderSide(
    color: AppTheme.kPrimaryColor,
  )
);


final kInterBold = GoogleFonts.inter(
  fontWeight: FontWeight.w700,
);
final kInterSemiBold = GoogleFonts.inter(
  fontWeight: FontWeight.w600,
);
final kInterMedium = GoogleFonts.inter(
  fontWeight: FontWeight.w500,
);
final kInterRegular = GoogleFonts.inter(
  fontWeight: FontWeight.w400,
);


