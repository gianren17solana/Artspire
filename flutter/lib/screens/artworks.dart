import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class Artworks extends StatelessWidget {
  const Artworks({super.key});

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
          "Artworks",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 34),
          ArtworkType(),
          SizedBox(height: 20),
          ArtworkImages(),
        ],
      ),
    );
  }
}

class ArtworkType extends StatelessWidget {
  const ArtworkType({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Commissions",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF7A88F2),
            ),
          ),

          const SizedBox(width: 25),

          Text(
            "Showcases",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFFC5C2D2),
            ),
          ),

          const SizedBox(width: 25),

          Text(
            "Personal",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFFC5C2D2),
            ),
          ),
        ],
      ),
    );
  }
}

class ArtworkImages extends StatelessWidget {
  const ArtworkImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
        crossAxisSpacing: 16,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: List.generate(6, (index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFF383843),
            ),
          );
        }),
      ),
    );
  }
}
