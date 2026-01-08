import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21212E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF21212E),
        elevation: 0,
        leadingWidth: 72,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/path.svg'),
          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ),
        centerTitle: true,
        title: Text(
          "Settings",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
