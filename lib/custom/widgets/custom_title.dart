import 'package:flutter/material.dart';
import 'package:quotify/custom/fonts/custom_fonts.dart';

Widget customTitle({required String title}) {
  return Padding(
    padding: const EdgeInsets.only(top: 15),
    child: Text(
      title,
      style: CustomFonts.mediumFont,
    ),
  );
}
