import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21212e),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 60, left: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "For the love of",
                  style: GoogleFonts.poppins(
                    fontSize: 62,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1,
                    height: 1.2,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "human creativity",
                  style: GoogleFonts.poppins(
                    fontSize: 62,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1,
                    height: 1.2,
                    color: const Color(0xFF7A88F2),
                  ),
                ),
              ],
            ),
          ),
        ],
      ) //Body 
    );
  }
}
