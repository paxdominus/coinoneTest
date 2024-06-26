import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomStyle {
  TextStyle getCStyle({double size = 12 }) {
    return GoogleFonts.poppins(textStyle: TextStyle(fontSize: size));
  }
}
